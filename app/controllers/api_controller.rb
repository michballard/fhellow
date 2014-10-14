class ApiController < ApplicationController

  def getuser
    @users = User.all.map do |user|
         {full_name: "#{user.name_first} #{user.name_last}", longitude: user.longitude, latitude: user.latitude, image_url: user.avatar.url(:thumb), job_title: user.job_title, bio_truncated: (user.bio.slice(0, 50) + "...") }
    end
    render json: @users
  end

end
