require 'spec_helper'

describe "SignUps" do
  describe "GET /sign_up" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sign_up_path
      response.status.should be(200)

    end

  end
  
  describe "signing up" do
    it "allows creation of new account" do
      email = "jan@boholo.com"
      password = "kanahan"
      signup(email, password)
      page.should have_content(email)
    end
  end

end
