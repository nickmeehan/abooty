get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/signup' do
	@user = User.new(name: params[:name],
									 handle: params[:handle],
									 email: params[:email])
	@user.password = params[:password_hash]
	@user.save!
	if @user.valid?
		@user = User.find_by_email(params[:email])
		sessions[:user_id] = @user.id
		redirect "/user/#{@user.id}"
	else
		redirect '/'
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])
	if @user && @user.password == params[:password_hash]
		sessions[:user_id] = @user.id
		redirect "/user/#{@user.id}"
	else
		redirect '/'
	end
end

post '/logout' do
	sessions[:user_id] = nil
	redirect '/'
end