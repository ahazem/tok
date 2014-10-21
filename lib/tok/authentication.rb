module Tok
  module Authentication
    extend ActiveSupport::Concern

    included do
      attr_accessor :password

      include Callbacks
    end

    module ClassMethods
      def authenticate(params)
        user = self.where(email: params[:email]).first
        user if user && BCrypt::Password.new(user.encrypted_password) == params[:password] 
      end
    end

    module Callbacks
      extend ActiveSupport::Concern

      included do
        before_save :encrypt_password
        before_save :ensure_authentication_token

        after_save :clear_password
      end
    end

    private

    def encrypt_password
      self.encrypted_password = encrypt(password) if password.present?
    end

    def ensure_authentication_token
      self.authentication_token = generate_authentication_token if authentication_token.blank?
    end

    def generate_authentication_token
      loop do
        random = SecureRandom.urlsafe_base64(nil, false)
        break random unless self.class.exists?(authentication_token: random)
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
