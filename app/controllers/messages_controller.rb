class MessagesController < ApplicationController
	before_action :log_in_user
	before_action :get_messages

  def index
  end

  def create
  	message = current_user.messages.build(message_params)
  	if message.save
  		ActionCable.server.broadcast "room_channel_user_#{}"
  	else
  		render 'index'
  	end
  end

  private

  def get_messages
  	@messages = Message.for_display
  end

  def message_params
  	params.require(:message).permit(:content)
  end
end
