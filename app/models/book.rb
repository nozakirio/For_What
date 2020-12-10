class Book < ApplicationRecord
  has_many :admin_books
  has_many :pos
end
