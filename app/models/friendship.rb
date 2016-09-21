class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, :class_name => "User"

	validate :do_not_add_self

	def do_not_add_self
		errors.add(:base, "Can't add youself as a friend") if user_id == friend_id
	end
end
