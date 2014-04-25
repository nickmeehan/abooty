get '/followers' do
	@user_followers = User.find(session[:user_id]).followers
	erb :followers
end

get '/following' do
	@user_following = User.find(session[:user_id]).following
	erb :following
end


post '/follow' do
	User.find(params[:user_id]).followers << User.find(session[:user_id])
	redirect "/users/#{params[:user_id]}"
end

post '/unfollow' do
	User.find(params[:user_id]).followers.destroy(User.find(session[:user_id]))
	redirect "/users/#{params[:user_id]}"
end