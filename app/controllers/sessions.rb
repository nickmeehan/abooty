get '/' do
	##note## Good place for some helper methods ##note##
	if session[:user_id]
		@aboots = Aboot.all
		redirect '/aboots'
	else
	  erb :index
	end
end

post '/signup' do
	##note## There is a lot of logic here, we can refactor ##note##
	@user = User.new(name: params[:name],
									 handle: params[:handle],
									 email: params[:email])
	@user.password = params[:password_hash]
	@user.save!
	##note## Shouldn't save something before it's valid ##note##
	if @user.valid?
		@user = User.find_by_email(params[:email])
		session[:user_id] = @user.id
		##note## Should redirect to '/' ##note##
		##note## Add success message? ##note##
		redirect "/aboots"
	else
		redirect '/'
	end
end

post '/login' do
	##note## Check login helper method here? ##note##
	@user = User.find_by_email(params[:email])
	if @user && @user.password == params[:password_hash]
		session[:user_id] = @user.id
		redirect "/aboots"
	else
		redirect '/'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end