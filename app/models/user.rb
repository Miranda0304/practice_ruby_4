class User < ApplicationRecord
  has_many :posts
  has_many :post_likes, dependent: :destroy
  has_many :liked_post, through: :post_likes, source: :post

  scope :active, -> { where(is_active: true) }
end
