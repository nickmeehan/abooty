class Aboot < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :reboots
  validates :content, presence: {message: "You can't aboot aboot nothing, you hoser"}
    #<ActiveModel::Errors:0x0000010221d1f0 @base=#<Aboot id: nil, user_id: 1, content: "", created_at: nil, updated_at: nil>, @messages={:content=>["can't be blank"]}>
  validates :content, length: { maximum: 140, message: "Don't write a novel, just tell us what you're aboot" }
    #<ActiveModel::Errors:0x00000101b59ad0 @base=#<Aboot id: nil, user_id: 1, content: "hellohellohellohellohellohellohellohellohellohello...", created_at: nil, updated_at: nil>, @messages={:content=>["is too long (maximum is 140 characters)"]}>
  validates :user_id, presence: {message: "You're not logged in.  How did you even attempt this aboot?"}
end
