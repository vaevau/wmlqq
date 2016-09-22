class User < ApplicationRecord
	has_secure_password

	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :messages

	# NAME_REGEX = /\w+/
	PERMITTED_ATTRS = [
		:name,
		:password,
		:password_confirmation
	].freeze
	
	validates :name, presence: true,
									 uniqueness: { case_sensitive: false},
									 # format: { with: /\A#{NAME_REGEX}\z/i },
									 length: { maximum: 15 }

  validates :password, length: { minimum: 6 },
  										 presence: true

  def all_friends
  	ids = Friendship.where(friend_id: id).map(&:user_id)
  	friends + User.where(id: ids)
  end
end
