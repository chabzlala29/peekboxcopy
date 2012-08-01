require 'spec_helper'

describe Profile::MessagesController do
  describe "GET compose" do
    context "when user has friends" do
      before do
        @user = User.find_by_username('user1')
        sign_in @user
      end

      it "should succeed" do
        get :compose
        response.should be_success
      end
    end

    context "when user doesn't have friends" do
      before do
        @user = User.find_by_username('nofriends')
        sign_in @user
      end

      it "should not succeed" do
        get :compose
        response.should_not be_success
        flash[:alert].should == "You currently have no friends. Please add some friends to use this feature."
      end
    end
  end
end