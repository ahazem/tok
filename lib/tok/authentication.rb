module Tok
  module Authentication
    extend ActiveSupport::Concern

    included do
      attr_accessor :password

      include Callbacks
    end

    module Callbacks
      extend ActiveSupport::Concern

      included do
        before_save :encrypt_password
        after_save :clear_password
      end
    end

    private

    def encrypt_password
      if password.present?
        self.encrypted_password = encrypt(password)
      end
    end

    def clear_password
      self.password = nil
    end

    def encrypt(password)
      BCrypt::Password.create(password, cost: Tok.configuration.bcrypt_cost)
    end
  end
end
