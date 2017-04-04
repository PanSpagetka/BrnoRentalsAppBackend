class Offers
require 'koala'
require 'typhoeus'
  @@offers

  def self.all
    @@offers = refresh
  end

  def self.refresh
    #oauth.url_for_oauth_code
    #oauth = Koala::Facebook::OAuth.new(12345, "secret", 'https://guarded-brook-34964.herokuapp.com/callback')
    #Typhoeus.get("www.example.com", followlocation: true)
    #binding.pry
    @@offers = get_data
  end

  def self.get_data
    mock_data
  end

  def self.mock_data
    [{:source_url => 'http://www.brnenske-byty.cz/nabidka-bytu/byt-ov-2-1-mikulovska-valtice_28646',:title => 'Super byt', :price => 15000, :description => 'Toho je strasne super byt pod zemi. Velky sklep. Vhodne pro psychopaty.',
      :preview_image => 'https://camo.mybb.com/e01de90be6012adc1b1701dba899491a9348ae79/687474703a2f2f7777772e6a71756572797363726970742e6e65742f696d616765732f53696d706c6573742d526573706f6e736976652d6a51756572792d496d6167652d4c69676874626f782d506c7567696e2d73696d706c652d6c69676874626f782e6a7067',
      :images => ['http://wallpaper-gallery.net/images/image/image-4.jpg', 'http://wallpaper-gallery.net/images/image/image-12.jpg'],
      :phone => '123456789', :email => 'email@email.cz', :fb_user => 'fb user', :area => '77m^2', :type => '3+1', :street => 'Knedlikova'},
      {:source_url => 'https://www.bezrealitky.cz/nemovitosti-byty-domy/359521-nabidka-pronajem-bytu-nove-sady-brno',:title => 'Pronájem bytu 3+kk bez realitky', :price => 14500, :description => ' Pronájem kompletně zařízeného mezonetového bytu, plně vybavená kuchyňská linka, TV, internet, pračka, 2x klimatizace, vestavěné skříně na míru, koupelna - vana + sprchový kout. Parkování možné ve dvoře, balkón s výhledem na Špilberk a Petrov, byt je volný od 06/2017 ',
        :preview_image => 'https://www.bezrealitky.cz/media/cache/record_main/data/record/images/359k/359521/1493363555-svgha-img-0151.jpg',
        :images => ['https://www.bezrealitky.cz/media/cache/record_main_nowm/data/record/images/359k/359521/616f06fcfb90ca740d1ac266a3578bbe.jpg', 'https://www.bezrealitky.cz/media/cache/record_main/data/record/images/359k/359521/1493363758-oigut-img-0154.jpg', 'https://www.bezrealitky.cz/media/cache/record_main/data/record/images/359k/359521/1493363555-svgha-img-0151.jpg'],
        :area => '100m^2', :type => '3+kk'},
      {:source_url => 'https://www.bezrealitky.cz/nemovitosti-byty-domy/469191-nabidka-pronajem-bytu-veletrzni-brno',:title => 'Pronájem bytu 3+1 bez realitky', :price => 16700, :description => 'Pronajmeme částečně vybavený byt 3+1 na ulici Veletržní v Brně s výbornou dostupností do centra Brna a kancelářských komplexů. Byt je v sedmém patře panelového domu, patří k němu sklepní kóje a má balkon. V pokojích jsou rok staré koberce (jeden s dětským motivem), v chodbě lino stejného stáří, v kuchyni, koupelně a na wc dlažba. Jádro je po rekonstrukci.',
        :area => '63m^2', :type => '3+1'},
      {:source_url => 'https://www.bezrealitky.cz/nemovitosti-byty-domy/456523-nabidka-pronajem-bytu-zborovska-brno',:title => 'SPronájem bytu 2+1 bez realitky', :price => 15000, :description => ' Nabízíme k dlouhodobému pronájmu byt po kompletní rekonstrukci o velikosti 2+1 s balkonem v 2.NP zatepleného, cihlového domu (s výtahem) v klidné, slepé ulici s výhledem na jedné straně do zeleně. Z chodby jsou samostatné vstupy do všech místností a je zde samostatné WC a koupelna s vanou. Kuchyň je vybavená zcela novou, moderní kuchyňskou linkou s plynovým sporákem',
        :area => '44m^2', :type => '2+1'}]
  end
end
