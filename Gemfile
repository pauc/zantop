# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "7.0.2.3"

gem "bcrypt", "~> 3.1.17"
gem "friendly_id", "~> 5.4.0"
gem "pg", "~> 1.1"
gem "puma", "~> 5.6"

# Assets
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "sprockets-rails"

# Image processing
gem "image_optim"
gem "image_optim_pack"
gem "image_processing", "~> 1.12"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Make forms easier to manage
gem "simple_form"

# i18n
gem "accept_language"
gem "globalize"
gem "route_translator", "~> 12.1.0"

# Pagination
gem "will_paginate", "~> 3.1"

# Truncate HTML content
gem "html_truncator"

group :development, :test do
  gem "debug"
  gem "method_source"

  gem "rspec-rails", "~> 5.0.0"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"

  gem "guard-rspec"
  gem "libnotify"
end

group :development do
  # Deployments
  gem "bcrypt_pbkdf",       require: false
  gem "capistrano",         require: false
  gem "capistrano3-puma",   require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-nvm",     require: false
  gem "capistrano-rails",   require: false
  gem "capistrano-rbenv",   require: false
  gem "ed25519",            require: false

  gem "listen", "~> 3.3"

  gem "guard-livereload", "~> 2.5",    require: false
  gem "rack-livereload",  "~> 0.3.17"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "factory_bot_rails"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end
