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

 #  def patch
	# redirect_to '/'  	
 #  end

end
