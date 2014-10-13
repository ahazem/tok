module Tok
  module Controller 
    extend ActiveSupport::Concern

    helpers = %w(resource resource_name resource_class)

    included do
      helper_method(*helpers) 
      hide_action(*helpers)
    end

    def resource
      Tok.configuration.resource.to_s
    end

    def resource_name
      resource.downcase
    end

    def resource_class
      resource.constantize
    end
  end
end
