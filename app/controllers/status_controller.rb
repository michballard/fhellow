class StatusController < ApplicationController

	def new
		@status = Status.new
		@user = User.find(params[:user_id])
	end

	def create
    @status = Status.create(params[:status].permit{:current_status})
    redirect_to user_profile
	end 

end
