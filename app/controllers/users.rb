post '/follow' do
	User.find(params[:user_id]).followers << User.find(session[:user_id])
	redirect "/users/#{params[:user_id]}"
end

post '/unfollow' do
	User.find(params[:user_id]).followers.destroy(User.find(session[:user_id]))
	redirect "/users/#{params[:user_id]}"
end