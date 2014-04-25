get '/aboots' do
  @aboots = Aboot.all
  erb :_home_page
end

get '/users/favorites' do
  @user = User.find(session[:user_id])
  @favorites = @user.favorites
  erb :_favorites_list
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  erb :_profile_page
end


