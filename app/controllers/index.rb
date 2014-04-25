get '/aboots' do
  @aboots = Aboot.all
  erb :_home_page
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  erb :_profile_page
end
