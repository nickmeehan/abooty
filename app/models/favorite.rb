class Favorite < ActiveRecord::Base
  validates :user, uniqueness: {scope: :aboot}

  belongs_to :user
  belongs_to :aboot
end
