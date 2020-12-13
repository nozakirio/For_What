class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :admin_books
  validates :reason, presence: true
end
