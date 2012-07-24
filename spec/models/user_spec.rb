require 'spec_helper'

describe User do
	describe "#register_new_user" do
		let(:user) { Factory(:username => 'maryon' ) }
		it "new user email should not have existing email registered" do 
			#vid = Video.new
			#vid.category.count.should == 1 
		end

		it "new user username should not have existing username" do 
			new_user = User.new(:username => 'maryon')
			User.register(new_user).should be_nil
		end

	end
end
