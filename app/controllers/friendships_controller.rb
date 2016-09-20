class FriendshipsController < ApplicationController
	before_action :log_in_user

  def new
  end

  def create
  	friendship = FriendShip.create(friend_params) 
  	if friendship.save?
  		redirect_to :root_url
  	else
  		render 'new'
  	end
  end

  private

  def friend_params
  	params.require(:friendship).permit(:user_id, :friend_id)
  end
end
