require 'spec_helper'

describe "post /follow reoute" do
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

	# it "unfollows a followed user" do
	# 	## Arrange
	# 	User.destroy_all
	# 	@user_1 = User.create(name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks')
	# 	p $yo = @user_1.id
	# 	@user_2 = User.create(name: '2rao2', handle: 'raorao2', email: 'frao2@gmail.com', password_hash: 'raosucks')
	# 	p @user_2.id
	# 	params = {user_id: @user_2.id, name: @user_2.name, handle: @user_2.handle, email: @user_2.email, password_hash: @user_2.password_hash}
	# 	fake_session = { 'rack.session' => { user_id: 65 } }
	# 	p fake_session[:user_id]
	# 	p params[:user_id]

	# 	## Act
	# 	post '/unfollow', params, fake_session

	# 	## Assert
	# 	expect(User.find(66).followers.count).to eq(1)
	# end
end

# describe "post /aboot/new route" do
#   it "adds aboot to DB" do
#     #Arrange
#     params = {
#               content: "Yo bro"
#     }
#     fake_session = { 'rack.session' => { user_id: 2 } }
#     Aboot.destroy_all

#     #Act
#     post 'aboots/new', params, fake_session

#     #Assert
#     expect(Aboot.count).to eq(1)
#   end