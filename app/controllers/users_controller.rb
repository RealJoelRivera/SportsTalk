class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @isMe = session[:user_id] == @user.id
     # if session[:user_id] != @user.id
       # redirect_to home_path
    #@user_posts = Post.find(params[:id]) # If i want to show every post for a given user, do I need to have a second private param in this controller page or should it be in the application controller?
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session["user_id"] = @user_id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
     end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render edit_user_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :bio, :password)
  end

end
