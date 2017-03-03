require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cities

  validates :username, :email, :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(given_password)
    self.hashed_password = BCrypt::Password.create(given_password)
  end

  def authenticate(given_password)
    self.password == given_password
  end

end
