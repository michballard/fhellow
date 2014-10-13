class ApiController < ApplicationController

  def getuser
    @users = User.all
    render json: @users.sort{|a,b| a.created_at <=> b.created_at}
  end

end
