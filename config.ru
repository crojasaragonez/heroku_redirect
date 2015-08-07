require 'dotenv'
Dotenv.load
require './index'
run Sinatra::Application
