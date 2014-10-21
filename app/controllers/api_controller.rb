class ApiController < ApplicationController

  def getuser

    if params["interests"] && params["interests"] != ""
        interests = params["interests"].split(",")
        users = []

        interests.each do |interest|
             users << User.all.select { |user| user.send(interest.gsub('-', '_')) }
        end

        @users = users.flatten.uniq.map do |user|
           {full_name: "#{user.name_first} #{user.name_last}", longitude: user.longitude, latitude: user.latitude, image_url: user.avatar.url(:thumb), job_title: user.job_title, bio_truncated: (user.bio.slice(0, 50) + "..."), town: user.town, user_id: user.id, first_name: user.name_first }
        end
    else
        @users = User.all.uniq.map do |user|
          {full_name: "#{user.name_first} #{user.name_last}", longitude: user.longitude, latitude: user.latitude, image_url: user.avatar.url(:thumb), job_title: user.job_title, bio_truncated: user.bio, town: user.town, user_id: user.id, first_name: user.name_first, current_user_id: user.id }
        end
    end

    render json: @users

  end

end
