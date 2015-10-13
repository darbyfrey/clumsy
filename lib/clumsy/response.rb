module Clumsy
  class Response

    def initialize(request, test_file)
      @request    = request
      @test_file  = test_file
    end

    def send_response
      response = @test_file.downstream.select{|x| x.request.url == @request.uri}.first.response

      ['200', {'Content-Type' => 'application/json'}, [response.to_json]]
    end

  end
end