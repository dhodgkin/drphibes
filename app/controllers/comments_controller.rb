class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_path
    else
      flash[:error] = "Shit.. couldn't create comment!"
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to stored_location_for(:user) || root_path
  end
end