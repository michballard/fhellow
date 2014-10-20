class SocializationsController < ApplicationController

    # before_filter :load_socializable

  def follow
    @other_user = User.find(params[:user_id])
    @current_user = User.find(params[:current_user_id])
    @current_user.follow!(@other_user)
    render json: { follow: true }

  end

  def unfollow
  	current_user.unfollow!(@socializable)
  	render json: { follow: false}
  end


end
