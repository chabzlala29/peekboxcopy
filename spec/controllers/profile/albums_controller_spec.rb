require 'spec_helper'

describe Profile::AlbumsController do

  describe "GET 'index'" do
    it "returns http redirect" do
      get 'index'
      response.should be_redirect
    end
  end

end
