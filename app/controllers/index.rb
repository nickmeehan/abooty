get '/users/:id' do
	@all_users = User.all
  @user = User.find(params[:id])
  erb :_profile_page
end
