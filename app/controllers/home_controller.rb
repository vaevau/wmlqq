class HomeController < ApplicationController
	before_action :log_in_user
  def index
  	@friends = current_user.friends
  end

end
