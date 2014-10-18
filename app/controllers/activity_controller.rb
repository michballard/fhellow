class ActivityController < ApplicationController

    def show
      @user = current_or_guest_user
      @posts = Post.all
     # unless @user == current_user
         #flash[:notice] = 'Please sign in to see Fhellow activity'
         #redirect_to '/users/sign_in'
      #end
    end

    def index
      @posts = Post.all      
    end
end
