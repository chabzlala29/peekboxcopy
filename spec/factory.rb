module Factory
  def self.setup
    user1 = User.create!(:email => "test1@test.com", :username => "user1", :password => "password")
    user2 = User.create!(:email => "test2@test.com", :username => "user2", :password => "password")
    user3 = User.create!(:email => "test3@test.com", :username => "user3", :password => "password")
    user4 = User.create!(:email => "test4@test.com", :username => "user4", :password => "password")
   

    Message.create!(:user => user1, :friend => user2, :message => "sent 1 week ago", :created_at => 1.week.ago)
    Message.create!(:user => user1, :friend => user2, :message => "sent 3 days ago", :created_at => 3.days.ago)
    Message.create!(:user => user1, :friend => user2, :message => "sent yesterday", :created_at => 1.day.ago)


    Friendship.create!(:user => user1, :friend => user2)
    Friendship.create!(:user => user1, :friend => user3)
    Friendship.create!(:user => user1, :friend => user4)
   

  end

  def self.teardown
    User.delete_all
    
  end
end