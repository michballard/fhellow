class SocializationsController < ApplicationController

    # before_filter :load_socializable

  def togglefollow
    @other_user = User.find(params[:user_id])
    @current_user = User.find(params[:current_user_id])
    @current_user.toggle_follow!(@other_user)
    if @current_user.follows?(@other_user) 
      render json: { follow: "Added" }
    else
      render json: {follow: "Add"}
    end
  end

  def toggle
    togglefollow
  end

end
