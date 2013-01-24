class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :new, :create]

  def index
    @users = User.all
  end
  
  def show
    if user_signed_in?
      @post = Post.new 
      @feed = User.find(params[:id]).feed
    end
    @user = User.find(params[:id])
  end

  def following
    show_follow(:following)
  end

  def followers
    show_follow(:followers)
  end

  def show_follow(action)
    @user = User.find(params[:id])
    @users = @user.send(action).paginate(:page => params[:page])
    render 'show_follow'
  end
end
