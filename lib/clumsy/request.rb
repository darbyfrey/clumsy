module Clumsy
  class Request
    attr_reader :uri

    def initialize(env)
      @method = env["REQUEST_METHOD"]
      @uri    = env["REQUEST_URI"]
    end

    def to_s
      "#{@method} #{@uri}"
    end
  end
end
