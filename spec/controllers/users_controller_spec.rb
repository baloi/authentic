require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be able to add a user" do
      num_users = User.count
      email = 'jan@yahoodoo.com'
      post :create, 
        :user => {:email => email, :password => "mypassword"}
    
      response.should be_redirect

      user = User.find(:all).first
      user.email.should == email 

      User.count.should eql (num_users + 1) 
    end
  
  end

end
