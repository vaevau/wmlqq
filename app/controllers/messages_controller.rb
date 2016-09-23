class MessagesController < ApplicationController
	before_action :log_in_user

  def index
  end

  def create
  	message = current_user.messages.build(message_params)
    render 'index'
  	if message.save
      friend_name = User.find_by(id: params[:message][:user_id]).name
      message = {user_id: message.user_id, content: message.content, friend_name: friend_name}
  		ActionCable.server.broadcast "room_channel_user_#{params[:message][:friend_id]}", message
  	else
  		# render 'index'
  	end
  end

  private

  def message_params
  	params.require(:message).permit(:content, :user_id, :friend_id)
  end
end
