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

  def create_therapist_from_params(obj_class_name, parameters)
    obj_class = Object.const_get(obj_class_name)
    new_obj = obj_class.new(parameters)
  end


end
