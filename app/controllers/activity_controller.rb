class ActivityController < ApplicationController

    def show
         @user = User.find(params[:user_id])
         @posts = Post.all
    end
end
