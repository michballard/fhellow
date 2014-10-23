class MessagingController < ApplicationController

  def conversation
    @user = current_or_guest_user
    @to = params[:from_id]
    @message = Message.get_message_between(current_user, params[:from_id])
  end

  def index
    @user = current_or_guest_user
    @messages = Message.get_all_messages_for(current_user)
  end

  def send_message
    @user = current_or_guest_user
    message = params[:message]
    conversation_code = [current_user.id, params[:to_id].to_i].sort.join("-")
    Message.create(from_id: current_user.id, to_id: params[:to_id], message: message, conversation_code: conversation_code)
    @message = Message.get_message_between(current_user, params[:to_id])
    @to = params[:to_id]
    render :conversation
  end
end
