source 'https://rubygems.org'

# Only define Ruby version once (i.e. for Heroku)
version_file = File.join(File.dirname(__FILE__), '.ruby-version')
ruby File.read(version_file).strip

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

gem 'puma'

gem 'pg'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Static pages
gem 'high_voltage', '~> 3.0.0'
gem 'lograge'

gem 'administrate'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

