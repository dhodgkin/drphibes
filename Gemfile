require 'rbconfig'
HOST_OS = Config::CONFIG['host_os']
RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems unless ENV['QUICK'] # source 'http://rubygems.org'

gem 'rails',                '3.1.1'

# authentication
gem 'devise',               '>= 1.4.7'
gem 'devise_invitable'

# helpers
gem 'frontend-helpers'
gem 'gravatar_image_tag'
gem 'will_paginate'

# deployment
gem 'heroku'
gem 'taps'

# asset template engines
gem 'jquery-rails'
gem 'rack-pjax'
gem 'sass-rails',         '~> 3.1.4'
gem 'coffee-rails',       '~> 3.1.1'
gem 'uglifier',           '>= 1.0.3'

group :production do
  gem 'pg'
end

group :development do
  gem 'rspec-rails',        '>= 2.6.1'
  gem 'sqlite3'
  gem 'annotate'
  gem 'faker',              '>= 0.3.1'
end

group :test do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-rails',        '>= 2.6.1'
  gem 'factory_girl_rails', '>= 1.2.0'
end

if HOST_OS =~ /linux/i
  gem 'therubyracer',       '>= 0.9.8'
end

# fixes an issue with commands declaring constant twice
#rack_ver = Gem.loaded_specs['rack'].version
#if ( rack_ver =~ /[0-9]+\.[0-9]+\.[0-9]+(?:\.[0-9]+)?/ )
#  gem 'rack',                 '1.3.5'
#end
