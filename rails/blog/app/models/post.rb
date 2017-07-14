class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :content, presence: true, length: { in: 1..140 }
  validates :title, presence: true, length: { in: 1..100 }
end
