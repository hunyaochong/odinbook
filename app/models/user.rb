class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :authored_posts, class_name: "Post", foreign_key: "author_id", dependent: :destroy
  has_and_belongs_to_many :liked_posts, class_name: "Post", join_table: "likes"
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  def name
    email.split("@").first.capitalize
  end
end
