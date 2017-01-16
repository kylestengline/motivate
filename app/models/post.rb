class Post < ApplicationRecord
	belongs_to :administrator
	has_many :comments
end
