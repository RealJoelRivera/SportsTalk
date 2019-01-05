class ApplicationController < ActionController::Base

  before_action :setup_global_errors
  helper_method :is_me?, :logged_in?, :current_user
private

  def is_me?(user)
    session[:user_id] == user.id
  end

  def setup_global_errors
      @errors = flash[:errors]
  end

  def current_user
    if session["user_id"]
      @logged_in_user = User.find(session["user_id"])
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    redirect_to "/users/new" unless logged_in?
  end

end
