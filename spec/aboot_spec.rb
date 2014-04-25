require 'spec_helper'

describe "post /aboot/new route" do
  it "adds aboot to DB" do
    #Arrange
    params = {
              content: "Yo bro"
    }
    fake_session = { 'rack.session' => { user_id: 2 } }
    Aboot.destroy_all

    #Act
    post 'aboots/new', params, fake_session

    #Assert
    expect(Aboot.count).to eq(1)
  end

end

