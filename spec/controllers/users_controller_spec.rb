require 'spec_helper'

describe UsersController do
  include SpecHelper
  before (:each) do
  end

  after(:each) do
    logout_and_refresh
  end

  describe "GET 'new'" do
    it "should be successful" do
      mock_signup_and_login
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be able to add a user" do
      
      email = 'b@yahoo.com'
      password = 'abcd' 

      mock_signup_and_login


      num_users = User.count

      post :create, 
        :user => {:email => email, :password => password}
      
      response.should be_redirect
      flash[:notice].should == 'Signed up!' 

      User.count.should eql (num_users + 1) 
      logout_and_refresh
    end
  
  end

end
