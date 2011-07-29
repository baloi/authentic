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
      visit sign_up_path 
      #click_link "password"
      fill_in "Email", :with => email
      fill_in "Password", :with => password 
      fill_in "Password Confirmation", :with => password 
      click_button "Submit"
      # click_on ('') # for button and link
      #visit "/users/list"
      #page.should have_content('jan@boholo.com')
      #page.should have_content("Signed up!")

    end
  end

end
