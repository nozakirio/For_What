class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { 男性: 0, 女性: 1 }

  validates :name, :birthday, :gender, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :admin_books, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :books, through: :admin_books
  has_many :favorites, dependent: :destroy
  attachment :profile_image
end
