require 'spec_helper'

describe "Logins" do
  describe "GET /logins" do
    it "should allow login of valid users" do
      email = "jan@boholo.com"
      password = "kanahan"
      signup(email, password)
  
      login(email, password)
      response.status.should be(200)
    end

  end

end

# SHOULD THIS BE IN ANOTHER FILE?
def signup(email, password)
  visit sign_up_path
  fill_in "Email", :with => email
  fill_in "Password", :with => password 
  fill_in "Password Confirmation", :with => password 
  click_button "Submit"
end

def login(email, password)
  #visit login_path
  visit '/login' 
  fill_in "Email", :with => email
  fill_in "Password", :with => password 
  # click_link "password"
  click_button "Submit"
end

