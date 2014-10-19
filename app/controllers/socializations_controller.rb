class SocializationsController < ApplicationController

    # before_filter :load_socializable

  def follow
    @other_user = User.find(params[:user_id])
    @current_user = User.find(params[:current_user_id])
    @current_user.follow!(@other_user)
    render json: { follow: true }

  end

  def unfollow
  	current_user.unfollow!(@socializable)
  	render json: { follow: false}
  end

# private

#   def load_socializable    
# 	  if id = params[:user_id]
# 	    @socializable = @community.comments.find(id)
# 	  else
# 	    raise ArgumentError, "Unsupported socializable model, params: " + params.keys.inspect
# 	  end
# 	  raise ActiveRecord::RecordNotFound unless @socializable
#   end

end
