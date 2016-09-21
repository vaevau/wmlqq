class HomeController < ApplicationController
	before_action :log_in_user
  def index
  	@friends = current_user.all_friends

  	respond_to do |format|
  		format.html
  	end
  end

end
