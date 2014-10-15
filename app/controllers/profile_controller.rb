class ProfileController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    "/users/#{resource.id}/edit_profile"
  end

  def edit_profile
    @user = User.find(params[:id])
    # render :edit_profile
  end 

  def update_profile
  	@user = User.find(params[:id])
  	@user.update(params[:user].permit(:name_first, :name_last, :email, :"job_title", :bio, :town, :country, :website, :linkedin, :discussing_ideas, :afterwork_drinks, :collaborating, :chat_over_a_coffee, :lunch_buddy, :advising ))
  	redirect_to user_profile_path(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

end