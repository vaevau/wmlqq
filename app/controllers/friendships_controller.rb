class FriendshipsController < ApplicationController
	before_action :log_in_user

  def new
  end

  def create
  	friendship = Friendship.create(user_id: current_user.id, friend_id: params[:friend_id]) 
  	if friendship.save
  		render json: {data: "add success"}
  	else
  		render json: {data: "failed"}
  	end
  end

end
