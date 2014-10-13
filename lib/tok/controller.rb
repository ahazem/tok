module Tok
  class Controller
    def self.resource_name
      resource.downcase
    end

    def self.resource_class
      resource.constantize
    end

    def self.resource
      Tok.configuration.resource.to_s
    end
  end
end
