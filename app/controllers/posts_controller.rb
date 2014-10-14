class PostsController < ApplicationController

    def new
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def create
        @user = User.find(params[:user_id])
        @user.posts.create(params[:post].permit(:content))
        redirect_to activity_user_path(@user)
    end

end
