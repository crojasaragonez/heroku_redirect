require 'sinatra'

TEMPORAL = 302

get '/*' do
  return 'REDIRECT_URL is not set' if ENV['REDIRECT_URL'].nil?
  http_code = ENV['REDIRECT_CODE'] || TEMPORAL
  redirect ENV['REDIRECT_URL'], http_code
end
