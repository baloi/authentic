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
