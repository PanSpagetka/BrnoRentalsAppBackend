module Facebook

require 'koala'
require 'config'


  def self.init
    Koala.configure do |config|
      config.access_token = MY_TOKEN
      config.app_access_token = MY_APP_ACCESS_TOKEN
      config.app_id = MY_APP_ID
      config.app_secret = MY_APP_SECRET
    end
  end

  def self.get_data
    @graph = Koala::Facebook::API.new
    a = @graph.get_object("411010232285957/feed")

    a.reject! {|p| p['message'].nil?}
    prices = a.map {|p| p['message'].scan(/\d+[,]*\d+.*Kč/).first }
    areas = a.map {|p| p['message'].scan(/\d+\s*m2|\d+\s*m\^2/).first }
    dispozitions = a.map {|p| p['message'].scan(/(\d\+\d|\d\+kk)/).first&.first}
    urls = a.map {|p| "https://www.facebook.com/#{p['id']}" }
    attachments = a.map {|p| @graph.get_object("#{p['id']}/attachments")}

    images = attachments.map do |pa|
      if !pa.first.nil?
        photos = []
        # binding.pry
        if pa.first.dig('type') == 'photo'
            photos.push(pa.first.dig('media')&.dig('image')&.dig('src'))
        elsif pa.first.dig('subattachments')&.dig('data')
          pa.first.dig('subattachments').dig('data').each do |sa|
            if sa.dig('type') == 'photo'
              photos.push(sa.dig('media')&.dig('image')&.dig('src'))
            end
          end
        end
        photos
      end
    end

    urls.map! {|x| {:source_url => x}}
    prices.map! {|x| {:price => x}}
    areas.map! {|x| {:area => x}}
    dispozitions.map! {|x| {:type => x}}
    images.map! {|x| {:images => x}}

    urls.zip(areas).map {|f, v| f.merge(v)}.
         zip(prices).map {|f, v| f.merge(v)}.
         zip(dispozitions).map {|f, v| f.merge(v)}.
         zip(images).map {|f, v| f.merge(v)}

  end
end
