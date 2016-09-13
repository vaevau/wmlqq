class User < ApplicationRecord
	has_secure_password
	NAME_REGEX = /\w+/
	PERMITTED_ATTRS = [
		:name,
		:password,
		:password_confirmation
	].freeze
	
	validates :name, presence: true,
									 uniqueness: { case_sensitive: false},
									 format: { with: /\A#{NAME_REGEX}\z/i },
									 length: { maximum: 15 }

  validates :password, length: { minimum: 6 },
  										 presence: true

end
