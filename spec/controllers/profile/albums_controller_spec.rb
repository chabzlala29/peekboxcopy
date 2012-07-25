require 'spec_helper'

describe Profile::AlbumsController do

  describe "GET 'index'" do
    it "returns http success" do
      sign_in User.last
      get 'index'
      response.should be_success
    end
  end

end
