module Clumsy
  class Server
    attr_reader :queue

    def initialize(test_file)
      @test_file  = test_file
      @queue      = Array.new
      @app        = nil
    end

    def start!
      app = Proc.new do |env|
        request   = Clumsy::Request.new(env)
        response  = Clumsy::Response.new(request, @test_file)
        @queue << request

        response.send_response
      end

      Thread.new do
        server = Rack::Handler::WEBrick.run app
      end
    end

  end
end