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

