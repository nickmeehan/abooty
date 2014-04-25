class User < ActiveRecord::Base
  has_many :aboots
  has_many :favorites

  validates :email, uniqueness: true
  validates :handle, uniqueness: true

  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end
end
