require 'digest'

class User < ActiveRecord::Base
  has_many :rounds
  before_save :encrypt_password

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

  def self.authenticate(email, password)
   user = User.where(:email => email, :password => password)
    if user.empty?
      nil
    else
      user
    end
  end

end
