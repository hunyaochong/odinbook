class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :author, class_name: "User"

  has_many :likes
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user

  scope :sort_by_recency, -> { order(created_at: :desc) }

  # to add counter cache instead
  def likes_count
    likers.count
  end

  def comments_count
    comments.count
  end
end
