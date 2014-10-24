class HomepageController < ApplicationController

  def index
    @users = []
    @user = current_or_guest_user
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(params[:user].permit(:latitude, :longitude))

  	redirect_to '/'
  end

  def update_location
    @user = User.find(params[:id])
    @user.longitude = params[:longitude].to_f
    @user.latitude = params[:latitude].to_f
    @user.save
    p @user.inspect
    render nothing: true
  end

 #  def patch
	# redirect_to '/'  	
 #  end

end
