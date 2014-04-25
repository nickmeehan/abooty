get '/aboots' do
  # @aboots = Aboot.all
  @aboots = news_feed
  erb :_home_page
end

post '/aboots/new' do
  Aboot.create(content: params[:content], user_id: session[:user_id])
  redirect '/aboots'
end

post '/reboots/new' do
  Reboot.create(aboot_id: params[:id], user_id: session[:user_id])
  redirect '/aboots'
end