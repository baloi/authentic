class SessionsController < ApplicationController
  def new
    @authenticated = false
    if session[:user_id]
      @authenticated = true
    end
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]


    user = User.authenticate(email, password)
  
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password" 
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
