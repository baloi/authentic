# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec


  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

#baloi start

module SpecHelper
#  def signup(email, password)
#    visit sign_up_path
#    fill_in "Email", :with => email
#    fill_in "Password", :with => password 
#    fill_in "Password Confirmation", :with => password 
#    click_button "Submit"
#  end
  
#  def login(email, password)
#    visit login_path
#    fill_in "Email", :with => email
#    fill_in "Password", :with => password 
#    # click_link "password"
#    click_button "Submit"
#  end
  
  def mock_signup
    visit root_path
    email = "wererw@iuiwoer.com", password = 'werwfiiuo'
    user = User.create(:email => email, :password => password)
  end

  def mock_signup_and_login
    user = mock_signup
    session[:user_id] = user.id
    user
  end
  
  def logout
    visit logout_path
  end
  
  def logout_and_refresh
    logout
    User.destroy_all
  end
end
#baloi end
