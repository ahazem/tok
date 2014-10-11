require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

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
