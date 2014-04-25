get '/' do
	if session[:user_id]
		@aboots = Aboot.all
		redirect '/aboots'
	else
	  erb :index
	end
end

post '/signup' do
	@user = User.new(name: params[:name],
									 handle: params[:handle],
									 email: params[:email])

	if params[:password_hash] == ""
		@user.password_hash = params[:password_hash]
	else
		@user.password = params[:password_hash]
	end
	@user.save

	flash[:notice] = error_messages(@user)

	if @user.valid?
		@user = User.find_by_email(params[:email])
		session[:user_id] = @user.id
		redirect "/aboots"
	else
		redirect '/'
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])

	if @user && @user.password == params[:password_hash]
		session[:user_id] = @user.id
		redirect "/aboots"
	else
		flash[:notice] = ["Wrong email and/or password"]
		redirect '/'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end