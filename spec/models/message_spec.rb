require 'spec_helper'

describe Message do
  before do
    @user  = User.find_by_username("user1")
    @user5 = User.find_by_username("user5")

    @userfriends1 = User.find_by_id(@user.friendships[0].friend_id)
    @userfriends2 = User.find_by_id(@user.friendships[1].friend_id)
    @userfriends3 = User.find_by_id(@user.friendships[2].friend_id)
  end

  describe "validation" do
    it "should require content for body" do
      expect{
        @user.messages.create!(:friend_id => @user5)
      }.should raise_error

      expect{
        @user.messages.create!(:friend_id => @user5, :message => "")
      }.should raise_error
    end
  end
end
