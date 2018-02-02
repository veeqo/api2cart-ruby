require 'active_support/configurable'

require 'api2cart/request_url_composer'
require 'api2cart/client'
require 'api2cart/store'
require 'api2cart/errors'
require 'api2cart/error_class_recognizer'

module Api2cart
  include ActiveSupport::Configurable

  config_accessor :host,
                  :api_version

  self.configure do |config|
    config.host         = 'api.api2cart.com'
    config.api_version  = '1.0'
  end
end
