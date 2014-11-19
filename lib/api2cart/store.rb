module Api2cart
  class Store < Struct.new(:api_key, :store_key)
    def method_missing(method_name, *args)
      request_url = RequestUrlComposer.new(api_key, store_key, method_name, args.first).compose_request_url

      api2cart_client = Client.new(request_url)
      api2cart_client.make_request!

      if api2cart_client.successful?
        api2cart_client.result
      else
        raise api2cart_client.error_message
      end
    end
  end
end
