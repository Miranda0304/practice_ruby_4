class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :no_deleted, -> { where(is_deleted: false) }
end
