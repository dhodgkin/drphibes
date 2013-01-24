class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]
  # before_filter :authorized_user, :only => :destroy

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new( :post => @post )
    @comments = Post.find(params[:id]).comments
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @post.destroy
    redirect_to stored_location_for(:user) || root_path
  end

  # private
    # def authorized_user
    #   @post = current_user.posts.find_by_id(params[:id])
    #   redirect_to root_path if @post.nil?
    # end
end