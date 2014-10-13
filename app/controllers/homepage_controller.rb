class HomepageController < ApplicationController

  def index
    @users = User.all
  end

end
