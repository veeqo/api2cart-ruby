require 'net/http'
require 'json'
require 'active_support/core_ext/object/blank'

module Api2cart
  class Client < Struct.new(:request_url, :proxy_url)
    READ_TIMEOUT = 2000

    def make_request!
      self.response_body = net_http.get(request_url.request_uri).body
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

    def return_code
      response_json['return_code']
    end

    protected

    attr_accessor :response_body

    def response_json
      @response_json ||= JSON.parse response_body
    end

    def parsed_proxy_url
      @parsed_proxy_url ||= URI.parse proxy_url
    end

    def net_http
      if proxy_url.present?
        Net::HTTP.new request_url.host, request_url.port, parsed_proxy_url.host, parsed_proxy_url.port
      else
        Net::HTTP.new request_url.host, request_url.port
      end.tap do |net_http|
        net_http.read_timeout = READ_TIMEOUT
      end
    end
  end
end
