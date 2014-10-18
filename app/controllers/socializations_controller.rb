class SocializationsController < ApplicationController

    before_filter :load_socializable

  def follow
    current_user.follow!(@socializable)
    render json: { follow: true }
  end

  def unfollow
  	current_user.unfollow!(@socializable)
  	render json: { follow: false}
  end

private

  def load_socializable    
	  if id = params[:user_id]
	    @socializable = @community.comments.find(id)
	  else
	    raise ArgumentError, "Unsupported socializable model, params: " + params.keys.inspect
	  end
	  raise ActiveRecord::RecordNotFound unless @socializable
  end

end
