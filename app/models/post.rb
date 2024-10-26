class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_and_belongs_to_many :liked_users, class_name: "User", join_table: "liked_posts"
end
