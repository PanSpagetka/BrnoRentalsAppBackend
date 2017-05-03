require 'sinatra'
require 'json'
require 'pry'
require 'offers'

class BrnoRentalsApp < Sinatra::Base

  get '/' do
    JSON.generate(Offers.all)
  end

  post '/like/:id' do
    source_url = Base64.decode64(params[:id])
    Offers.all.map! do |a|
      a[:likes] += 1 if a[:source_url] == source_url
      a
    end
  end

  get '/callback' do
    params
  end
end
