get '/aboots' do
  ##note## This should not render a partial or homepage, it should render index instead ##note##
  ##note## To see all aboots, this get route should be '/' or redirect there ##note##
  @aboots = Aboot.all
  erb :_home_page
end

post '/aboots/new' do
  ##note## This should redirect to the news feed ('/') ##note##
  Aboot.create(content: params[:content], user_id: session[:user_id])
  redirect '/aboots'
end

post '/reboots/new' do
  ##note## This should redirect to the news feed ('/') ##note##
  Reboot.create(aboot_id: params[:id], user_id: session[:user_id])
  redirect '/aboots'
end

