source 'https://rubygems.org'

ruby "2.2.3"

gem 'rails', '4.2.1'

gem "twitter-bootstrap-rails"
gem 'twitter', '~> 5.8.0'
gem "unicorn"
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"

gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
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
  gem 'sqlite3', '~> 1.3.10'
  gem 'heroku_san'
  gem 'heroku'
end

group :test do
  gem "rspec-rails", "~> 3.2.1"
  gem 'capybara'
end
