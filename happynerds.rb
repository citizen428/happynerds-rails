APP_ROOT = File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'

#set :root, APP_ROOT

include Mongo

db = Connection.new(ENV['DATABASE_URL'], ENV['DATABASE_PORT'], :slave_ok => true).db('happynerds')
if ENV['DATABASE_USER'] && ENV['DATABASE_PASSWORD']
  auth = db.authenticate(ENV['DATABASE_USER'], ENV['DATABASE_PASSWORD'])
end

configure :production do
  enable :raise_errors
end

get '/' do
  @page = "Programming for kids?"
  haml :index
end

get '/view/:os' do
  @page = params[:os]
  redirect '/' unless %w(linux mac windows browser).include? @page
  @sites = db['sites']
  haml :os
end

get '/*' do
  redirect '/'
end

