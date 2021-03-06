post '/aboots/new' do
  aboot = Aboot.create(content: params[:content], user_id: session[:user_id])

  flash[:notice] = error_messages(aboot)

  redirect '/'
end

post '/reboots/new' do
  Reboot.create(aboot_id: params[:id], user_id: session[:user_id])
  redirect '/'
end

get '/global' do
  @aboots = global_feed
  erb :_home_page
end
