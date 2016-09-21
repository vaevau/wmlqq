class UsersController < ApplicationController
  include SessionsHelper
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		login @user
  	else
  		render 'new'
  	end
  end

  def search 
    search = params[:search]
    @user = User.find_by(name: search)
    if @user
      render json: @user
    else
      render json: {error_message: 'User not found'}
    end
  end

  private

  def user_params
  	params.require(:user).permit(User::PERMITTED_ATTRS)
  end
end
