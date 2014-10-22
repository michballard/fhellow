class SocializationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def togglefollow
    @other_user = User.find(params[:user_id])
    @current_user = User.find(params[:current_user_id])
    @current_user.toggle_follow!(@other_user)
    if @current_user.follows?(@other_user) 
      render json: { follow: "Following", 
							      	new_follower_count: "#{pluralize(@other_user.followers(User).count, "Follower")}", 
							      	new_following_count: @other_user.followees(User).count }
    else
      render json: {follow: "Follow", 
							      	new_follower_count: "#{pluralize(@other_user.followers(User).count, "Follower")}", 
							      	new_following_count: @other_user.followees(User).count }
    end
  end

  def toggle
    togglefollow
  end

end
