module Clumsy
  class TestFile

    def initialize(file)
      begin
        @file = File.read(file)
        @data = Hashie::Mash.new JSON.parse(@file)
      rescue Errno::ENOENT
        raise 'File Not Found'
      end
    end

    def request_method
      @data.request_method
    end

    def request_url
      @data.request_url
    end

    def downstream
      @data.downstream
    end

    def response
      @data.response
    end

  end
end
