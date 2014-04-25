get '/' do
	if session[:user_id]
		@aboots = Aboot.all
		erb :welcome
	else
	  erb :index
	end
end

post '/signup' do
	@user = User.new(name: params[:name],
									 handle: params[:handle],
									 email: params[:email])
	@user.password = params[:password_hash]
	@user.save!
	if @user.valid?
		@user = User.find_by_email(params[:email])
		session[:user_id] = @user.id
		redirect "/user/#{session[:user_id]}"
	else
		redirect '/'
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])
	if @user && @user.password == params[:password_hash]
		session[:user_id] = @user.id
		redirect "/user/#{session[:user_id]}"
	else
		redirect '/'
	end
end

post '/logout' do
	sessions[:user_id] = nil
	redirect '/'
end