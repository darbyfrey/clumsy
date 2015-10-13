module Clumsy
  class Server
    attr_reader :inbound_requests

    def initialize(test_file)
      @test_file                = test_file
      @inbound_requests         = Array.new
      @inbound_request_strings  = Array.new
      @app                      = nil
    end

    def start!
      app = Proc.new do |env|
        request   = Clumsy::Request.new(env)
        response  = Clumsy::Response.new(request, @test_file)
        @inbound_requests << request
        @inbound_request_strings << request.to_s

        response.send_response
      end

      Thread.new do
        server = Rack::Handler::WEBrick.run app
      end
    end

    def did_receive_request(request_string)
      @inbound_request_strings.include?(request_string)
    end

  end
end