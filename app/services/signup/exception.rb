module Signup
  class Exception < StandardError
    attr_reader :type
    
    def initialize(args)
      @type = args[:type]
      super(args[:msg])
    end
  end
end