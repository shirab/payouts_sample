require 'json'
require 'net/http'
require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  uri = URI('https://api.venmo.com/payments')
  @payouts_response = Net::HTTP.post_form(uri, params)
  erb :index
end
