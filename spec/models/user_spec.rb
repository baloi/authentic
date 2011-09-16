require 'spec_helper'

describe User do
  it "should be able to encrypt password" do
    email = "bead@uwer.com"
    password = "password"
    user = User.create(:email => email, :password => password)

    user.password_hash.should_not == nil
  end

  it "should be able to authenticate user" do
    email = "bead@uwer.com"
    password = "password"
    user = User.create(:email => email, :password => password)

    authenticated = User.authenticate(email, password)

    authenticated.password_hash.should == user.password_hash
  end
end
