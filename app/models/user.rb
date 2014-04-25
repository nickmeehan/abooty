class User < ActiveRecord::Base
  has_many :aboots
  has_many :connections, foreign_key: :follower_id
  has_many :followers, through: :connections, source: :user
  validates :name, presence: true
  validates :handle, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true
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
    following = Connection.where(user_id: session[:user_id])
    following.map! do |followed|
      User.find(followed.follower_id)
    end
  end
end
