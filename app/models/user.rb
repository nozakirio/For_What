class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum gender: { 男性: 0, 女性: 1}
  
  validates :name,:birthday,:gender, presence: true
  
  has_many :admin_books
  has_many :books, through: :admin_books
  attachment :profile_image
  
end
