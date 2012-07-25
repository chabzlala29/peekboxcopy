require 'spec_helper'

describe User do
  before do
    @user = User.find_by_username("user1")
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
      @user.messages[0].message.should == "sent 1 week ago"
      @user.messages[1].message.should == "sent 3 days ago"
      @user.messages[2].message.should == "sent yesterday"
    end
  end
end
