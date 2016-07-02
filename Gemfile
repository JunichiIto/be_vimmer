source 'https://rubygems.org'

ruby "2.3.1"

gem 'rails', '5.0.0'

gem "twitter-bootstrap-rails"
gem 'twitter', '~> 5.8.0'
gem "puma"
gem "haml"
gem "haml-rails"
gem "jquery-rails"

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'less-rails'
gem 'therubyracer'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'sqlite3'
  gem 'heroku_san'
  gem 'heroku'
end

group :test do
  gem "rspec-rails", "~> 3.5.0"
  gem 'capybara'
end
