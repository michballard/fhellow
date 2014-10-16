class ApiController < ApplicationController

  def getuser
    if params["interests"]
        interests = params["interests"].split(",") 
        users = []

        interests.each do |interest|  
             users << User.all.select { |user| user.send(interest.gsub('-', '_')) }
        end

         @users = users.flatten.uniq.map do |user|
            {full_name: "#{user.name_first} #{user.name_last}", longitude: user.longitude, latitude: user.latitude, image_url: user.avatar.url(:thumb), job_title: user.job_title, bio_truncated: (user.bio.slice(0, 50) + "...") }
         end
    else

        @users = User.all.map do |user|
            {full_name: "#{user.name_first} #{user.name_last}", longitude: user.longitude, latitude: user.latitude, image_url: user.avatar.url(:thumb), job_title: user.job_title, bio_truncated: (user.bio.slice(0, 50) + "...") }
        end
    end

    render json: @users
  end

end
