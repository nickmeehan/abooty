class Reboot < ActiveRecord::Base
  belongs_to :user
  belongs_to :aboot
  belongs_to :reboot
end
