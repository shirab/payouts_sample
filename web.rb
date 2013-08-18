require 'json'
require 'net/http'
require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  # Send payment via Venmo Payouts API.

  # # Below is an example of `params` passed by the request form.
  # params = {
  #   'access_token' => 'WfztST4W428gJDCbzESw9rnvhxX7C4H3',
  #   'phone' => '123-456-7890',
  #   'amount' => '0.01',
  #   'note' => "I'm testing to see if this works. Thanks! :-)",
  #   'audience' => ''
  # }

  uri = URI('https://api.venmo.com/payments')
  # uri = URI('http://localhost:5000/mock_response_success')
  @payouts_response = Net::HTTP.post_form(uri, params)
  erb :index
end

# post '/mock_response_error' do
#   content_type :json
#   status_code = 401
#   response_body = {
#     error: {
#       code: 261,
#       message: "You did not pass a valid OAuth access token."
#     }
#   }.to_json
#   [status_code, response_body]
# end
#
# post '/mock_response_success' do
#   content_type :json
#   status_code = 200
#   response_body = {
#     action: "pay",
#     balance: 1.98,
#     id: 2692663,
#     message: "Paid $0.01 and notified Matt Di Pasquale of your payment.",
#     status: "PAYMENT_SETTLED",
#     target_user_id: 39917
#   }.to_json
#   [status_code, response_body]
# end
