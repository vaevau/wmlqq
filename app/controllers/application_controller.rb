class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def log_in_user
  	unless log_in?
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end
end
