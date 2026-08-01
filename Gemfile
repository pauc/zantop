# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.6"

gem "rails", "~> 8.1.3"

# Default gems extracted from the Ruby stdlib (3.4/4.0) that Rails 7.0 still requires
gem "base64"
gem "benchmark"
gem "bigdecimal"
gem "cgi"
gem "drb"
gem "logger"
gem "mutex_m"
gem "observer"
gem "ostruct"

gem "bcrypt", "~> 3.1.22"
gem "friendly_id", "~> 5.7.0"
gem "pg", "~> 1.1"
gem "puma", "~> 8.0"

# Assets
gem "cssbundling-rails"
gem "jsbundling-rails"
gem "sprockets-rails"

# Image processing
gem "image_optim"
gem "image_optim_pack"
gem "image_processing", "~> 2.0"
# image_processing 2.0 no longer depends on a backend, so the one we use
# (ImageProcessing::Vips, and ActiveStorage's vips variant processor) has
# to be declared here.
gem "ruby-vips", "~> 2.3"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Make forms easier to manage
gem "simple_form"

# i18n
gem "accept_language"
gem "mobility", "~> 1.3.2"
gem "mobility-actiontext"
gem "route_translator", "~> 16.2"

# Pagination
gem "will_paginate", "~> 4.0"

# Truncate HTML content
gem "html_truncator"

group :development, :test do
  gem "debug"
  gem "method_source"

  gem "guard-rspec"
  gem "libnotify"
  gem "rspec-rails", "~> 8.0"

  # Mutation testing
  gem "mutant",       "~> 0.16.3", require: false
  gem "mutant-rspec", "~> 0.16.3", require: false

  gem "rubocop",             require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails",       require: false
  gem "rubocop-rspec",       require: false
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

  gem "guard-livereload", "~> 2.5", require: false
  # Held at 0.3.x: 0.6.1 caps rack at < 3.2, which would pull the whole app
  # back a rack minor for a development-only convenience.
  gem "rack-livereload",  "~> 0.3.17"
end

group :test do
  gem "factory_bot_rails"
  # Restores assigns and render_template for controller specs
  gem "rails-controller-testing"
end
