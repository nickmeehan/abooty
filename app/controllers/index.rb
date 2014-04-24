get '/' do
  erb :index
end

get '/aboots' do
  @aboots = Aboot.all
  erb :_home_page
end