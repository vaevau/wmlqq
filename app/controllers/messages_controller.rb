class MessagesController < ApplicationController
	before_action :log_in_user

  def index
  end

  def create
  	message = current_user.messages.build(message_params)
  	if message.save
  		ActionCable.server.broadcast "room_channel_user_#{params[:message][:user_id]}", message
  	else
  		# render 'index'
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:content, :user_id, :friend_id)
  end
end
