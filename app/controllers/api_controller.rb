class ApiController < ApplicationController

	def getuser
    @users = User.all
    @users.each do |user|
      render json: { first_name: user.name_first, last_name: user.name_last, job_title: user.job_title,
                     location: user.location, bio: user.bio, latitude: user.latitude, longitude: user.longitude }
	    end
    end
end
