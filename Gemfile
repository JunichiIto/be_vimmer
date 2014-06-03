source 'https://rubygems.org'

ruby "2.1.2"

gem 'rails', '4.0.4'

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
end

group :production, :staging do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'heroku_san'
  gem 'heroku'
end

group :test do
  gem "rspec-rails", "~> 3.0.1"
  gem 'capybara'
end
