get '/' do
	if session[:user_id]
	  @aboots = personal_feed
	  erb :_home_page
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
		redirect "/"
	else
		redirect '/'
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])

	if @user && @user.password == params[:password_hash]
		session[:user_id] = @user.id
		redirect "/"
	else
		flash[:notice] = ["Wrong email and/or password"]
		redirect '/'
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end