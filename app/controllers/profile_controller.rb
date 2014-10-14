class ProfileController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    "/users/#{resource.id}/edit_profile"
  end

  def edit_profile
    @user = User.find(params[:id])
    # render :edit_profile
  end 

  def update_profile
  	redirect_to user_profile_path(params[:id])
  end

  def show
  end

end