get '/followers' do
	@users = User.find(session[:user_id]).followers
	erb :users
end

get '/following' do
	@users = User.find(session[:user_id]).following
	erb :users
end


post '/follow' do
	User.find(params[:user_id]).followers << User.find(session[:user_id])
	redirect "/users/#{params[:user_id]}"
end

post '/unfollow' do
	User.find(params[:user_id]).followers.destroy(User.find(session[:user_id]))
	redirect "/users/#{params[:user_id]}"
end
