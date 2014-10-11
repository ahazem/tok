require 'bcrypt'

module Tok
  class Configuration
    attr_accessor :resource,
                  :bcrypt_cost

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

    private

    def test_environment?
      defined?(:Rails) && Rails.env.test?
    end
  end
end
