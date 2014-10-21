class StatusController < ApplicationController

	def new
		@status = Status.new
		@user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
    @status = @user.statuses.create(params[:status].permit(:current_status))
    redirect_to user_profile_path(@user)
	end 

end
