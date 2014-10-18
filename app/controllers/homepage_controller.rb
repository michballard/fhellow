class HomepageController < ApplicationController

  def index
    @users = []
    @user = current_or_guest_user
  end

end
