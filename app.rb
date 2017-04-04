require 'sinatra'
require 'json'
require 'pry'
require 'offers'

class BrnoRentalsApp < Sinatra::Base

  get '/' do
    JSON.generate(Offers.all)
  end

  get '/callback' do
    params
  end
end
