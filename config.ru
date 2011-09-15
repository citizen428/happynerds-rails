# To use with thin
#  thin start -p PORT -R config.ru
require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'happynerds.rb')

disable :run
set :environment, :production
run Sinatra::Application
