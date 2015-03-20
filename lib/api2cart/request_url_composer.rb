require 'uri'
require 'active_support/core_ext/object/to_query'

module Api2cart
  class RequestUrlComposer < Struct.new(:api_key, :store_key, :method_name, :query_params)
    PATH_BASE = '/v1.0'

    def compose_request_url
      URI::HTTP.build host: host, path: full_path, query: query_string
    end

    protected

    def host
      Api2cart.host
    end

    def full_path
      "#{PATH_BASE}/#{dotted_method_name}.json"
    end

    def dotted_method_name
      method_name.to_s.gsub('_', '.')
    end

    def query_string
      { api_key: api_key, store_key: store_key }.merge(query_params || {}).to_param
    end
  end
end
