APP_ROOT = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'

set :root, APP_ROOT

get '/' do
  "Hell, world!"
end



