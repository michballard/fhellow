class PostsController < ApplicationController

    def new
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(params[:post].permit(:content, :image, :latitude, :longitude))
        redirect_to activity_user_path(@user)
    end

    def edit 
    	@post = Post.find(params[:id])
    end 

end
