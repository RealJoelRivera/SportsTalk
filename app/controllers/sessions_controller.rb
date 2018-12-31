class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user_id
      redirect_to "/users/#{@user.id}"
    else
    end
  end

end
