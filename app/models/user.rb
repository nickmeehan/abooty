class User < ActiveRecord::Base
  has_many :aboots
  has_many :reboots
  has_many :favorites
  has_many :connections, foreign_key: :follower_id
  has_many :followers, through: :connections, source: :user
  validates :name, presence: { message: "Really, no name?"}
  validates :handle, presence: { message: "You need a handle homie"}
  validates :email, presence: {message: "If you don't have an email address, get one"}
  validates :password_hash, presence: {message: "You probably want a password"}
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

  def following
    following = Connection.where(user_id: self.id)
    following.map do |followed|
      User.find(followed.follower_id)
    end
  end
end
