class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :author, class_name: "User"

  has_and_belongs_to_many :likers, class_name: "User", join_table: "likes"
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user

  def likes_count
    likers.count
  end
end
