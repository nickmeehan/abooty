get '/users/:id' do
  @user = User.find(params[:id])
  erb :_profile_page
end
