require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'

configure :production do
  enable :raise_errors
  require 'newrelic_rpm'
end

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    auth ||= Rack::Auth::Basic::Request.new(request.env)
    auth.provided? &&
      auth.basic? &&
      auth.credentials &&
      auth.credentials == [ENV['AUTH_USER'], ENV['AUTH_PW']]
  end
end

uri = URI.parse(ENV['MONGOHQ_URL'])
conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
db = conn.db(uri.path.gsub(/^\//, ''))

# if ENV['DATABASE_USER'] && ENV['DATABASE_PASSWORD']
#   auth = db.authenticate(ENV['DATABASE_USER'], ENV['DATABASE_PASSWORD'])
# end

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

get '/add' do
  protected!
  @page = "Add"

  haml :add
end

post '/add' do
  @page = "Result"
  document = params
  document['tags'] = document['tags'].split(/\s*,\s*/)
  @result = db['sites'].insert(document)

  haml :add
end

get '/*' do
  redirect '/'
end

