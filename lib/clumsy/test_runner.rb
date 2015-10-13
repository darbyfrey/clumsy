module Clumsy
  class TestRunner

    attr_reader :response

    def initialize(server, test_file)
      @server     = server
      @test_file  = test_file
    end

    def send_request
      @response = HTTP.send(@test_file.request_method.downcase.to_sym, @test_file.request_url)
    end

    def process
      send_request
    end

  end
end
