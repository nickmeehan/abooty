def current_user
  @user = User.find(1) || nil
end