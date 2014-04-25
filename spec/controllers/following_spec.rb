require 'spec_helper'

describe "get /following route" do
	it "check to see if current user is following a new user" do
		## Arrange
		User.destroy_all
		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
		params = {user_id: @user_2.id}
		fake_session = { 'rack.session' => { user_id: @user_1.id } }
		post '/follow', params, fake_session

		## Act
		get '/following', params, fake_session

		## Assert
		expect(last_response.body).to include("#{@user_2.handle}")
	end
end

# describe "get /followers route" do
# 	it "check to see if current user has a new follower" do
# 		## Arrange
# 		User.destroy_all
# 		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
# 		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
# 		params = {user_id: @user_2.id}
# 		fake_session = { 'rack.session' => { user_id: @user_1.id } }
# 		post '/follow', params, fake_session
# 		# post '/logout'
# 		fake_session2 = { 'rack.session' => { user_id: @user_2.id } }

# 		## Act
# 		get '/followers'

# 		## Assert
# 		expect(last_response.body).to include("#{@user_1.handle}")
# 	end
# end
