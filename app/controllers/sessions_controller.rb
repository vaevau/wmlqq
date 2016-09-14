class SessionsController < ApplicationController
	before_action :find_user
	
  def new
  end

  def create

  end

  def destroy
  end

  private

  def find_user
  	@user = User.find_by(name: params[:name])
  end
end
