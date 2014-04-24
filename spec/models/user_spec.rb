require 'spec_helper'

describe User do
	let(:user) { User.new(name: "Nick", handle: "nnmeehan", email: "nnmeehan@gmail.com", password_hash: "DBC") }

	it "should save a user's information" do
		user.save
		expect(user.name).to eq "Nick"
		expect(user.handle).to eq "nnmeehan"
		expect(user.email).to eq "nnmeehan@gmail.com"
	end

	context "validations" do
		it { should validate_uniqueness_of :handle }
		it { should validate_uniqueness_of :email }
	end


end