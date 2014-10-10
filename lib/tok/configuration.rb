module Tok
  class Configuration
    attr_accessor :resource

    def resource
      @resource || ::User
    end
  end
end
