require 'bcrypt'

module Tok
  class Configuration
    attr_accessor :resource,
                  :bcrypt_cost,
                  :signup_route,
                  :login_route,
                  :logout_route

    def resource
      @resource || ::User
    end

    def bcrypt_cost
      if test_environment?
        BCrypt::Engine::MIN_COST
      else
        @bcrypt_cost || BCrypt::Engine::DEFAULT_COST
      end
    end

    def signup_route
      @signup_route || "signup"
    end

    def login_route
      @login_route || "login"
    end

    def logout_route
      @logout_route || "logout"
    end

    private

    def test_environment?
      defined?(:Rails) && Rails.env.test?
    end
  end
end
