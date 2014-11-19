require 'net/http'
require 'json'

module Api2cart
  class Client < Struct.new(:request_url)
    def make_request!
      self.response_body = Net::HTTP.get_response(request_url).body
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
  end
end
