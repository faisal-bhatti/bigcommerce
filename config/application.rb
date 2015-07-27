require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BugTrackingAngular
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # config.active_job.queue_adapter = :delayed_job
    # config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
    #   allow do
    #     origins '*'

    #     resource '/cors',
    #       :headers => :any,
    #       :methods => [:post],
    #       :credentials => true,
    #       :max_age => 0

    #     resource '*',
    #       :headers => :any,
    #       :methods => [:get, :post, :delete, :put, :options, :head],
    #       :max_age => 0
    #   end
    # end

    # require File.expand_path('config/initializers/gmail_config', Rails.root)
    require File.expand_path('config/initializers/mandril_config', Rails.root)

    ActionMailer::Base.smtp_settings = {
        address: ENV['MANDRILL_SMTP_HOST'],
        :port => 587,
        :authentication => :plain,
        :user_name => ENV['MANDRILL_SMTP_USER'],
        :password => ENV['MANDRILL_SMTP_PASSWORD'],
        :enable_starttls_auto => true
    } 
  end
end
