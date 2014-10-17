class MessagingController < ApplicationController

  def conversation
    @to = params[:from_id]
    @message = Message.get_message_between(current_user, params[:from_id])
  end

  def index
    @messages = Message.get_all_messages_for(current_user)
  end

  def send_message
    message = params[:message]
    conversation_code = [current_user.id, params[:to_id].to_i].sort.join("-")
    Message.create(from_id: current_user.id, to_id: params[:to_id], message: message, conversation_code: conversation_code)
    @message = Message.get_message_between(current_user, params[:to_id])
    @to = params[:to_id]
    render :conversation
  end
end
