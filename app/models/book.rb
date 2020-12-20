class Book < ApplicationRecord
  has_many :admin_books
  has_many :users, through: :admin_books
  has_many :posts
  validates :title,:author,:isbn, presence: true
end
