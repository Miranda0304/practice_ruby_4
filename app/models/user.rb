class User < ApplicationRecord
  has_many :posts
  scope :active, -> { where(is_active: true) }
end
