require 'uri'
require 'active_support/core_ext/object/to_query'
require 'active_support/core_ext/module/delegation'

module Api2cart
  class RequestUrlComposer < Struct.new(:api_key, :store_key, :method_name, :query_params)

    delegate  :host,
              :api_version,
              to: :Api2cart

    def compose_request_url
      URI::HTTP.build host: host, path: full_path, query: query_string
    end

    protected

    def full_path
      "/v#{api_version}/#{dotted_method_name}.json"
    end

    def dotted_method_name
      method_name.to_s.gsub('__', '-').gsub('_', '.').gsub('-', '_')
    end

    def query_string
      { api_key: api_key, store_key: store_key }.merge(query_params || {}).to_param
    end
  end
end
