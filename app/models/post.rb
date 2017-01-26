class Post < ApplicationRecord
#	has_many :comments

  validates :content, presence: true
  validates :author, presence: true
  validates :story, presence: true
  validates :votes, presence: true
end
