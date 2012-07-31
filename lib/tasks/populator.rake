namespace :populator do
  desc "Populate test data"
  task :populate_all => :environment do
    User.delete_all
    Message.delete_all
    Friendship.delete_all

    100.times do |index|
      User.create!(:email => "test#{index}@test.com", :username => "test#{index}", :password => 'password')
    end

    User.all.each do |user|
      potential_friends = (User.all - [user] - user.friendships)
      10.times do |index|
        user.add_friend(potential_friends[index])
        user.messages.create!(:friend => potential_friends[index], :message => "Hello there!!! Message ##{index}.")
        potential_friends[index].messages.create!(:friend => user, :message => "Hello there!!! Message ##{index}.")
      end
    end
  end
 

end