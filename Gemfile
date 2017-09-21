source "https://rubygems.org"

gem "rails", "~> 5.0"

gem "sass-rails"
gem "bootstrap-sass", "~> 3"
gem "bootswatch-rails", "~> 3"

gem "uglifier"
gem "coffee-rails", "~> 4"

gem "mongoid", "~> 6"

gem "devise"
gem "carrierwave"
gem "carrierwave-mongoid", require: "carrierwave/mongoid"
gem "will_paginate_mongoid"

gem "mini_magick"
gem "chronic"

gem "slim"
gem "slim-rails", "3.1.1" # Avoids a bug with ckeditor and later versions of slim

gem "jquery-rails"
gem "bootstrap-datepicker-rails"
gem "bootstrap-timepicker-rails"
gem "ckeditor", "~> 4"

gem "tzinfo-data"

gem "rollbar"

gem "pry-byebug", group: [:development, :test]

group :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "capybara"
end

group :production do
  gem 'therubyracer'
end
