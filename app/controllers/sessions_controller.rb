class SessionsController < ApplicationController

  def index
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/sessions"
    end
  end

   def destroy
     session["user_id"] = nil
  #   if reset_session
  #     redirect_to home_path
  #   end
    redirect_to home_path 
   end

end
