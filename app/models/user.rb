class User < ApplicationRecord
	has_many :posts
	has_many :comments
	belongs_to :administrator
	has_secure_password
end
