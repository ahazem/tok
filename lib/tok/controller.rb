module Tok
  module Controller 
    extend ActiveSupport::Concern

    helpers = %w(authenticate! resource resource_name resource_class)

    included do
      helper_method(*helpers) 
      hide_action(*helpers)
    end

    def authenticate!
      head :unauthorized unless authorized?
    end

    def authorized?
      resource = resource_class.where(authentication_token: token).first
      resource && secure_compare(resource.authentication_token, params[:token])
    end

    def token
      request.headers["HTTP_AUTHORIZATION"] || params[:token]
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
