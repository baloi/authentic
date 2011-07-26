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
      post :create, :user => {:email => 'jan@yahoodoo.com', :password => "mypassword"}
    
      response.should be_redirect
      #assert_redirected_to :action => 'list'
      ##response.should redirect_to(:action => 'list')
      response.should redirect_to :root

      User.count.should eql (num_users + 1) 
    end
  
  end

end
