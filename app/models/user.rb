class User < ApplicationRecord
	validates_uniqueness_of :email
	validates_presence_of :first_name, :last_name
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "has invalid format!" }
	
	has_secure_password
	has_secure_token :auth_token

	has_many :requests, :dependent => :delete_all
	has_many :volunteers, :dependent => :delete_all   #falta migrar para db
	has_one_attached :govid, :dependent => :delete_all

	def invalidate_token
		self.update_columns(auth_token: nil)
	end

	def self.validate_login(email, password)
		user = find_by(email: email)
		if user && user.authenticate(password)
			user
		end
	end
end
