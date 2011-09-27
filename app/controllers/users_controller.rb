class UsersController < ApplicationController
  
  before_filter :login_required
  def new
    @user = User.new
  end

  # POST /users
  before_filter :login_required
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to @user, :notice => "Signed up!"
    else
      render "new"
    end
  end

  before_filter :login_required
  def list
    @users = User.find(:all)
  end

  before_filter :login_required
  def show
    @user = User.find(params[:id])
  end

  def login
    #if email == nil or password  == nil
    if params[:user] == nil
      puts "showing login page"
      @user = User.new    
      #redirect_to '/users/login' 
    else
      #email = params[:user][:email]
      #password = params[:user][:password]
      email = params[:user][:email]
      password = params[:user][:password]

      user_find = User.new
      user_find.email = email
      user_find.password = password
      user_find.encrypt_password
      @user = User.find(:all, 
                :conditions => ["email = ? AND password_hash = ?", 
                email, user_find.password_hash]
              ).first

      redirect_to @user 
    end
  end
end
