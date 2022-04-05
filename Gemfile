# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "pg", "~> 1.1"
gem "puma", "~> 5.6"
gem "rails", "7.0.2.3"
# Use SCSS for stylesheets
gem "bcrypt", "~> 3.1.17"
gem "sass-rails", ">= 6"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Make forms easier to manage
gem "simple_form"

# i18n
gem "accept_language"
gem "globalize"
gem "route_translator", "~> 12.1.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 5.0.0"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "listen", "~> 3.3"
  # Display performance information such as SQL time and flame graphs for each request
  # in your browser.
  # Can be configured to work on production as well see:
  # https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end
