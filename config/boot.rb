ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "logger" # Rails 7.0 needs Logger loaded before ActiveSupport (concurrent-ruby >= 1.3.5).
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
