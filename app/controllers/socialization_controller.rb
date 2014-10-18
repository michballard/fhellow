class SocializationController < ApplicationController
    before_filter :load_socializable

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
  end


end