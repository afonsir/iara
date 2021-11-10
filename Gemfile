# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'activerecord-postgis-adapter', '~> 7.1'
gem 'graphql', '~> 1.12'
gem 'interactor', '~> 3.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'tzinfo-data', '~> 1.2021', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.19'
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop', '~> 1.22', require: false
  gem 'rubocop-faker', '~> 1.1'
  gem 'rubocop-rails', '~> 2.12', require: false
  gem 'rubocop-rspec', '~> 2.5', require: false
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'rspec-rails', '~> 5.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21.2', require: false
end
