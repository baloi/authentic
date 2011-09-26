class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    #return true
    if session[:user_id]
      @authenticated = true
    else
      redirect_to root_url, :notice => "Please login"
    end
  end

end
