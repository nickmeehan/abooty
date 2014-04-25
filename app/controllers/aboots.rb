get '/aboots' do
  @aboots = Aboot.all
  erb :_home_page
end

post '/aboots/new' do
  aboot = Aboot.create(content: params[:content], user_id: session[:user_id])

  # flash[:notice] = aboot.errors.messages[:content].first

  flash[:notice] = aboot.errors.full_messages.first

  redirect '/aboots'
end

post '/reboots/new' do
  Reboot.create(aboot_id: params[:id], user_id: session[:user_id])
  redirect '/aboots'
end