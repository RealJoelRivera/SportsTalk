class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    post = Post.find(comment_params[:post_id])
    redirect_to sport_path(post.sport.id)
  end



private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
