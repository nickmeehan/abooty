class Reboot < ActiveRecord::Base
  belongs_to :user
  belongs_to :aboot
  belongs_to :reboot

  def <<(re_item)
    if re_item.instance_of? Aboot
      self.aboot << re_item
    elsif re_item.instance_of? Reboot
      self.reboot << re_item
      self.aboot << re_item.aboot
    end
  end
end
