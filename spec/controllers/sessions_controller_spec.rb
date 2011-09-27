require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    include SpecHelper
    it "should be successful" do
      mock_signup_and_login
      get 'new'
      response.should be_success
    end
  end

end
