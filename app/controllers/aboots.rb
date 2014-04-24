post '/aboot/new' do
  Aboot.create(content: params[:content], user_id: session[:user_id])
  redirect '/aboots'
end