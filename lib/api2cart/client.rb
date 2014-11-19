require 'net/http'
require 'json'
require 'active_support/core_ext/object/blank'

module Api2cart
  class Client < Struct.new(:request_url, :proxy_url)
    def make_request!
      self.response_body = net_http_class.get_response(request_url).body
    end

    def successful?
      return_code == 0
    end

    def error_message
      response_json['return_message']
    end

    def result
      response_json['result']
    end

    protected

    attr_accessor :response_body

    def response_json
      @response_json ||= JSON.parse response_body
    end

    def return_code
      response_json['return_code']
    end

    def parsed_proxy_url
      @parsed_proxy_url ||= URI.parse proxy_url
    end

    def net_http_class
      proxy_url.present? ?
        Net::HTTP::Proxy(parsed_proxy_url.host, parsed_proxy_url.port) :
        Net::HTTP
    end
  end
end
