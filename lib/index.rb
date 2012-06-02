require 'sinatra'
require_relative 'models/products'

get '/' do
  @products = []
  erb :index
end

post '/search' do
  @products = Products.search params[:keywords]
  erb :index
end