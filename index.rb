require 'sinatra'

TEMPORAL = 302

get '/' do
  return 'NEW_BASE_URL is not set' if ENV['NEW_BASE_URL'].nil?
  http_code = ENV['REDIRECT_CODE'] || TEMPORAL
  redirect ENV['NEW_BASE_URL'], http_code
end
