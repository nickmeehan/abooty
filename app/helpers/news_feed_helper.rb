helpers do

  def news_feed
    feed_aboots = []
    feed_aboots << get_following_aboots
    feed_aboots << get_following_reboots
    feed_aboots.flatten.sort_by { |aboot| aboot.created_at }
  end

  def get_following_aboots
    feed_aboots = []
    following = current_user.following
    following.each { |following| feed_aboots << following.aboots }
    feed_aboots
  end

  def get_following_reboots
    feed_reboots = []
    following = current_user.following
    following.each { |following| feed_reboots << following.reboots }
    feed_reboots.flatten.map { |reboot| reboot.aboot }
  end

end