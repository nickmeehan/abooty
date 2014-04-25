class Aboot < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :reboots
  validates :content, presence: {message: "You can't aboot aboot nothing, you hoser"}
  validates :content, length: { maximum: 140, message: "Don't write a novel, just tell us what you're aboot" }
  validates :user_id, presence: {message: "You're not logged in.  How did you even attempt this aboot?"}
end
