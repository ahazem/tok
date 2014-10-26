module Tok
  module Controller 
    extend ActiveSupport::Concern

    helpers = %w(authenticate! current_user resource resource_name resource_class)

    included do
      helper_method(*helpers) 
      hide_action(*helpers)
    end

    def authenticate!
      authentication_required unless authorized?
    end

    def current_user
      resource_class.where(authentication_token: token).first
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

    private

    def authentication_required
      self.headers["WWW-Authenticate"] = 'Token realm="Application"'
      render json: {error: "Access denied."}, status: :unauthorized
    end

    def authorized?
      resource = resource_class.where(authentication_token: token).first
      resource && secure_compare(resource.authentication_token, token)
    end

    def token
      request.headers["HTTP_AUTHORIZATION"] || params[:token]
    end

    # Adopted from Devise, licensed under MIT.
    # Copyrights 2009 - 2014 Plataformatec.
    def secure_compare(a, b)
      return false if a.blank? || b.blank? || a.bytesize != b.bytesize

      l = a.unpack "C#{a.bytesize}"

      res = 0
      b.each_byte { |byte| res |= byte ^ l.shift }
      res == 0
    end
  end
end
