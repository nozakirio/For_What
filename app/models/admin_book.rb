class AdminBook < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :book
end
