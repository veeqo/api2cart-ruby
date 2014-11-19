module Api2cart
  class Store
    attr_accessor :api_key, :store_key, :proxy

    def initialize(api_key, store_key, proxy: nil)
      self.api_key = api_key
      self.store_key = store_key
      self.proxy = proxy
    end

    def method_missing(method_name, *args)
      request_url = RequestUrlComposer.new(api_key, store_key, method_name, args.first).compose_request_url

      api2cart_client = Client.new(request_url, proxy)
      api2cart_client.make_request!

      if api2cart_client.successful?
        api2cart_client.result
      else
        raise api2cart_client.error_message
      end
    end
  end
end
