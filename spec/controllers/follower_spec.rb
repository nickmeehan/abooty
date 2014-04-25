require 'spec_helper'

describe "post /follow route" do
	it "follows a new user" do
		## Arrange
		User.destroy_all
		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
		params = {user_id: @user_2.id}
		fake_session = { 'rack.session' => { user_id: @user_1.id } }

		## Act
		post '/follow', params, fake_session

		## Assert
		expect(User.find(@user_2.id).followers.count).to eq(1)
	end
end

describe "post /unfollow route" do
	it "unfollows a new user" do
		## Arrange
		User.destroy_all
		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
		params = {user_id: @user_2.id}
		fake_session = { 'rack.session' => { user_id: @user_1.id } }

		## Act
		post '/follow', params, fake_session
		post '/unfollow', params, fake_session

		## Assert
		expect(User.find(@user_2.id).followers.count).to eq(0)
	end
end

describe "get /users/:id route" do
	it "no longer has a follow button, and displays an unfollow button" do
		## Arrange
		User.destroy_all
		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
		params = {user_id: @user_2.id}
		fake_session = { 'rack.session' => { user_id: @user_1.id } }
		post '/follow', params, fake_session

		## Act
		get "/users/#{@user_2.id}"

		## Assert
		expect(last_response.body).to include('unfollow')
	end

	it "no longer displays an unfollow button after an unfollow action is taken" do
		## Arrange
		User.destroy_all
		@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
		@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
		params = {user_id: @user_2.id}
		fake_session = { 'rack.session' => { user_id: @user_1.id } }
		post '/follow', params, fake_session
		post '/unfollow', params, fake_session

		## Act
		get "/users/#{@user_2.id}"

		## Assert
		expect(last_response.body).to_not include('unfollow')
	end
end

