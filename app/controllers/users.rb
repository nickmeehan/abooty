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

# get '/results' do
#   if params[:user_input]
#     search_terms = params[:user_input].downcase
#     @users = User.where("de_handle LIKE ? or de_name LIKE ?", "%#{search_terms}%", "%#{search_terms}%")
#     # @users = User.all
#   end
#   erb :users
# end