class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :sort_by_recency, -> { order(created_at: :desc) }
end
