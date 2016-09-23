class SessionsController < ApplicationController
	include SessionsHelper
  def new
  end

  def create
		user = User.find_by(name: params[:session][:name])  	
		if user && user.authenticate(params[:session][:password])
			login user
			redirect_to root_path
		else
			flash.now[:danger] = 'Invalid username/password combination'
			render 'new'
		end
  end

  def destroy
  	logout 
  	redirect_to root_path
  end

end
