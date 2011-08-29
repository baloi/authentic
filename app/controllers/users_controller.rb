class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to @user, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def list
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    email = params[:user][:email]
    password = params[:user][:password]
    if email == nil or password  == nil
      redirect_to '/users/login' 
    else
      user_find = User.new
      user.email = email
      user.password = password
      user.encrypt_password
      @user = User.find(:all, 
                :conditions => ["email = ? AND password_hash = ?", 
                email, user.password_hash]
              ).first
      redirect_to @user 
    end
  end
end
