post '/aboot/new' do
  content = params[:content]
  Aboot.create(content: params[:content], user_id: session[:user_id])
  redirect '/'
end