# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Zantop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    # `components` is required by hand from config/initializers/simple_form.rb
    # — it reopens a gem's namespace, which Zeitwerk would refuse to autoload
    # from a path that does not spell it out.
    config.autoload_lib(ignore: %w[assets tasks components])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.available_locales = [:ca, :en, :es]
    config.i18n.default_locale    = :ca
    config.i18n.fallbacks         = true

    # Set on a deployment that is not the real site — the provisional-domain
    # rehearsal in docs/cutover-runbook.md, which serves the whole portfolio
    # under a hostname that resolves publicly and so can be found and indexed as
    # a duplicate of mireiazantop.com, outliving the rehearsal that created it.
    # Unset everywhere else, which is why the default is the safe one for
    # production rather than for a test.
    config.x.noindex = ENV["ZANTOP_NOINDEX"] == "true"

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
