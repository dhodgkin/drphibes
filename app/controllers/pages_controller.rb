class PagesController < ApplicationController
  def index
    @feed = Post.all
  end

  def home
    if user_signed_in?
      @post = Post.new 
      @feed = current_user.feed.paginate(:page => params[:page])
    end
    @users = User.all
  end

  def about
  end

  def contact
  end

  def help
  end
end
