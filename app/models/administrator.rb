class Administrator < ApplicationRecord
	has_secure_password
	has_many :posts
end
