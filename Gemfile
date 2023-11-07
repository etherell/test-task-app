# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'

# System
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.1'

# Utils
gem 'tzinfo-data'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# API
gem 'jbuilder', '~> 2.11', '>= 2.11.5'

# Front end
gem 'sassc-rails', '~> 2.1.2'
gem 'slim', '~> 5.1', '>= 5.1.1'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.20'
  gem 'lefthook', '~> 1.1.1', require: false
  gem 'pry-rails', '~> 0.3'

  # Code quality
  gem 'brakeman', '~> 5.3.1', require: false
  gem 'bundler-audit', '~> 0.8', require: false
  gem 'bundler-leak', '~> 0.3', require: false
  gem 'fasterer', '~> 0.9', require: false
  gem 'rails_best_practices', '~> 1.23.1', require: false
  gem 'rubocop', '~> 1.35', require: false
  gem 'rubocop-faker', '~> 1.1', require: false
  gem 'rubocop-performance', '~> 1.15', require: false
  gem 'rubocop-rails', '~> 2.16', require: false
  gem 'rubocop-rspec', '~> 2.13', require: false
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'spring', '~> 4.1.0'
end

group :test do
  gem 'capybara', '~> 3.37'
  gem 'capybara-screenshot', '~> 1.0'
  gem 'database_cleaner', '~> 2.0.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.1'
  gem 'rspec-sidekiq', '~> 3.1.0'
  gem 'shoulda-matchers', '~> 5.2.0'
  gem 'simplecov', '~> 0.21', require: false
  gem 'site_prism', '~> 3.7'
  gem 'webdrivers', '~> 5.2.0'
end

gem 'importmap-rails', '~> 1.2'

gem 'tailwindcss-rails', '~> 2.0'
