class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to (@post.user)
    else render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to "/posts/#{@post.id}"
    else render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end

end
