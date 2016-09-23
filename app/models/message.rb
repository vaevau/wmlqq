class Message < ApplicationRecord
	belongs_to :user
	validates :content, presence: true
	validates :user_id, presence: true
	validates :friend_id, presence: true

	scope :for_display, -> (user_id) { where(friend_id: user_id)
																			.order(:created_at).last(50) }

	def self.chats(user_id, friend_id)
  	where("(user_id = ? AND friend_id = ?) OR 
  					(user_id = ? AND friend_id =?)", 
  					user_id, 
  					friend_id, 
  					friend_id, 
  					user_id)
  		.order(:created_at)
  		.last(50)
  end
end
