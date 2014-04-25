get '/aboots' do
  ##note## This should render index.erb and be '/', repeat? ##note##
  @aboots = Aboot.all
  erb :_home_page
end

get '/users/favorites' do
  ##note## This route should be '/favourites' ##note##
  ##note## Should render index.erb file calling helper method to make list ##note##
  @user = User.find(session[:user_id])
  @favorites = @user.favorites
  erb :_favorites_list
end

get '/users/:id' do
  ##note## Is there a _profile_page partial? This should be a normal view I think ##note##
	@all_users = User.all
  @user = User.find(params[:id])
  erb :_profile_page
end
