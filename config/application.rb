require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ImprezifyV2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # adds template view to the path
    config.paths['app/views'].unshift(Rails.root.join("app/presenters/resume_templating_engine/templates"))

    config.active_job.queue_adapter = :async

    ActiveSupport::Dependencies.autoload_paths << "#{config.root}/presenters"
    ActiveSupport::Dependencies.autoload_paths << "#{config.root}/imprezify"

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_options = { from: 'info@imprezify.com' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address:              ENV['SMTP_HOST'],
      port:                 ENV['SMTP_PORT'],
      domain:               ENV['DOMAIN'],
      user_name:            ENV['SMTP_USER'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true
    }
    config.hosts = ['127.0.0.1', 'localhost', 'lvh.me', ENV['DOMAIN']]
  end
end
