post '/favorite/new/:aboot_id' do
  Favorite.create(user: User.find(session[:user_id]), aboot: Aboot.find(params[:aboot_id]))
  redirect '/aboots'
end