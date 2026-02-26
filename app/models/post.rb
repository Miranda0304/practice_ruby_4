class Post < ApplicationRecord
  belongs_to :user
  has_many :posts

  scope :active, -> { where(is_active: true) }
end
