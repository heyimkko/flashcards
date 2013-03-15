require 'digest'

class User < ActiveRecord::Base
  has_many :rounds
  before_save :encrypt_password

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

  def authenticate(password)
    encrypt_password == self.password
  end

end
