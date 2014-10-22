class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user_count = User.all.count
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
    end
    new_user_count = User.all.count
    
    if new_user_count > user_count
      redirect_to edit_profile_path(@user.id)
    else
      redirect_to '/'
    end
  end

  # def old?(user)
  #   if User.find(user.id)
  #     @old = true
  #   else
  #     @old = false
  #   end
  # end

end