class PostsController < ApplicationController


  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post].permit(:content, :image, :latitude, :longitude))
    redirect_to activity_user_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:content, :image, :latitude, :longitude))
    redirect_to activity_user_path(@user)
  end

end
