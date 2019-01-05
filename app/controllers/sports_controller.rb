class SportsController < ApplicationController

  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
    @comment = Comment.new
  end

  def edit
    redirect_to edit_post_path
  end

end
