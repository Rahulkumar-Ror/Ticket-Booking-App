require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webinari
  class Application < Rails::Application
    config.load_defaults 7.0
    config.exceptions_app = self.routes
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.eager_load_paths << Rails.root.join("app/services")
    config.action_controller.default_protect_from_forgery = false # unless ENV["RAILS_ENV"] == "production"
    config.active_job.queue_adapter = :sidekiq
    config.i18n.available_locales = [:en, :de, :fr]
    config.i18n.default_locale = :en
    config.time_zone = 'Central Time (US & Canada)'
    config.beginning_of_week = :sunday
  end
end
