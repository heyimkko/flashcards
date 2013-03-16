require 'bcrypt'

class User < ActiveRecord::Base
  has_many :rounds
  attr_reader :password_present

  validates :email, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end


  def self.authenticate(test_user)
    user = User.find_by_email(test_user['email'])
    return user if user && (user.password == test_user['password'])
    nil # either invalid email or wrong password
  end
end

