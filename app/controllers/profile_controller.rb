class ProfileController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    '/users/edit_profile'
  end

  def editprofile
    render :edit_profile
  end 

end 