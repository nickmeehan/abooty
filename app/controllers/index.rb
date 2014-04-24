get '/' do
  erb :index
end

# get '/' do
#   # Look in app/views/index.erb
#   erb :index
# end

get '/aboots' do
  @aboots = Aboot.all
  erb :_home_page
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  erb :_profile_page
end
