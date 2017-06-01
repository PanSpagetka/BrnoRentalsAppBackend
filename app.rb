require 'sinatra'
require 'json'
require 'pry'
require 'offers'


class BrnoRentalsApp < Sinatra::Base

  post '/like/*' do
    source_url = Base64.decode64(params[:id])
    changed = {}
    Offers.all.map! do |a|
      if a[:source_url] == source_url
        a[:likes] += 1
        changed = a
      end
      a
    end
    Offers.save
    JSON.generate(changed)
  end

  get '/' do
    JSON.generate(Offers.all)
  end



  get '/callback' do
    params
  end
end
