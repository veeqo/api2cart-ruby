require 'uri'
require 'active_support/core_ext/object/to_param'

module Api2cart
  class RequestUrlComposer < Struct.new(:api_key, :store_key, :method_missing, :query_params)
    HOST = 'api.api2cart.com'
    PATH_BASE = '/v1.0'

    def compose_url
      URI::HTTP.build host: HOST, path: full_path, query: query_string
    end

    protected

    def full_path
      dotted_method_name = method_missing.gsub('_', '.')
      "#{PATH_BASE}/#{dotted_method_name}.json"
    end

    def query_string
      { api_key: api_key, store_key: store_key }.merge(query_params).to_query
    end
  end
end
