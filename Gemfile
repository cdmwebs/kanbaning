source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'sqlite3'
gem 'thin'
gem 'haml-rails'
gem 'high_voltage', ">= 1.2.0"
gem 'rdiscount'
gem 'airbrake'
gem 'ember-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'
end

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.12.0'
  gem 'dotenv'
end

group :test do
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
end

group :staging, :production do
  gem 'newrelic_rpm'
end

