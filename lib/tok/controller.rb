module Tok
  module Controller 
    extend ActiveSupport::Concern

    helpers = %w(authenticate! current_user model model_name model_class)

    included do
      helper_method(*helpers) 
      hide_action(*helpers)
    end

    def authenticate!
      authentication_required unless authorized?
    end

    def current_user
      model_class.where(authentication_token: token).first
    end

    def model 
      Tok.configuration.model.to_s
    end

    def model_name 
      model.downcase
    end

    def model_class 
      model.constantize
    end

    private

    def authentication_required
      self.headers["WWW-Authenticate"] = 'Token realm="Application"'
      render json: {error: "Access denied."}, status: :unauthorized
    end

    def authorized?
      model = model_class.where(authentication_token: token).first
      model && secure_compare(model.authentication_token, token)
    end

    def token
      token_header || params[:token]
    end

    def token_header
      request.headers["HTTP_AUTHORIZATION"].tr('"', '').split('=')[1]
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
