require 'spec_helper'

describe User do
  before do
    @user  = User.find_by_username("user1")
    @user5 = User.find_by_username("user5")
   
    @userfriends1 = User.find_by_id(@user.friendships[0].friend_id)
    @userfriends2 = User.find_by_id(@user.friendships[1].friend_id)
    @userfriends3 = User.find_by_id(@user.friendships[2].friend_id)
    
  end

	describe "validation" do
    it "should validate unique email" do
      expect{
        User.create!(:email => @user.email, :username => "unique-username", :password => "password")
      }.to raise_error
    end

   it "should validate unique username" do
      expect{
        User.create!(:email => "user@user.com" , :username => @user.username, :password => "password")
      }.to raise_error
    end
  end

  describe "messages" do
    it "should be ordered according to date created" do
      @user.messages[0].message.should == "sent yesterday"
      @user.messages[1].message.should == "sent 3 days ago"
      @user.messages[2].message.should == "sent 1 week ago"
    end
  end

  describe "friend" do
    it "should be something" do
      @userfriends1.username.should == "user2"
      @userfriends2.username.should == "user3"
      @userfriends3.username.should == "user4"
    end

  end

  describe "#add_friend" do
    it "should reciprocate friendships" do
      @user.add_friend(@user5)
      @user.friends.should  include(@user5)
      @user5.friends.should include(@user)
    end
  end
  
  describe "#friends_with?" do
	it "should be friends with" do
	  result = @user.friends_with?(@user,@user5)
		
	  result.should == true
	end
  end
  
  describe "#remove_friend" do
    it "should delete a friend" do
      result = @user.remove_friend(@user,@user5)
		
      result.should == false
		
	end
  end
end
