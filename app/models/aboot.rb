class Aboot < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
  validates :user_id, presence: true
end
