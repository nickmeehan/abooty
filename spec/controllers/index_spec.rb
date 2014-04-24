require 'spec_helper'

describe "get / route" do
	it "shows a sign-up and login screen" do
		## Arrange

		## Act
		get '/'

		## Assert
		# last_response
		# last_request
		expect(last_response.body).to include('signup', 'login')
	end
end


describe "post /signup reoute" do
	it "creates a new user" do
		## Arrange
		params = {name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks'}
		User.destroy_all
		# session = { 'rack.session' => { user_id: 1 } }

		## Act
		post '/signup', params

		## Assert
		expect(User.count).to eq(1)
	end
end