require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FastShoppy
  class Application < Rails::Application
  	#we need to configure our routes to handle the different error status codes
  	config.exceptions_app = self.routes
  end
end
