class Aboot < ActiveRecord::Base
  belongs_to :user
  validates: content: true
end
