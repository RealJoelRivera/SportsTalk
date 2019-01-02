class ApplicationController < ActionController::Base

  before_action :setup_global_errors, :setup_user_stuff

private

  def setup_global_errors
      @errors = flash[:errors]
  end

  def setup_user_stuff
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
