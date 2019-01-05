class PostsController < ApplicationController

  before_action :authenticate, only: [:index, :show, :new, :edit]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @sports = Sport.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to "/posts"
    else
      @users = User.all
      @sports = Sport.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @sports = Sport.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to "/posts/#{@post.id}"
    else render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:content, :sport_id, :user_id)
    end

end
