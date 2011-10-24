require 'rbconfig'
HOST_OS = Config::CONFIG['host_os']
RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems unless ENV['QUICK'] # source 'http://rubygems.org'

gem 'rack',                 '1.3.5'
gem 'rails',                '3.1.1'
gem 'haml',                 '>= 3.1.2'
gem 'devise',               '>= 1.4.7'
gem 'cancan'
gem 'jquery-rails'
gem 'frontend-helpers'
gem 'heroku'
gem 'taps'
gem 'thin'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails',        '>= 2.6.1'
end

group :development do
  gem 'haml-rails',         '>= 0.3.4'
  gem 'annotate',           '>= 2.4.0'
end

group :test do
  gem 'factory_girl_rails', '>= 1.2.0', :group => :test
  gem 'cucumber-rails',     '>= 1.1.1', :group => :test
  gem 'capybara',           '>= 1.1.1', :group => :test
  gem 'database_cleaner',   '>= 0.6.7', :group => :test
  gem 'launchy',            '>= 2.0.5', :group => :test
end

group :assets do
  gem 'sass-rails',         '~> 3.1.4'
  gem 'coffee-rails',       '~> 3.1.1'
  gem 'uglifier',           '>= 1.0.3'
end

if HOST_OS =~ /linux/i
  gem 'therubyracer',       '>= 0.8.2'
end

