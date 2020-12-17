class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :admin_books
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :reason, presence: true
  validates :star, :comment, presence: true, on: :update
end
