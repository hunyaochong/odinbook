class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :authored_posts, class_name: "Post", dependent: :destroy
  has_and_belongs_to_many :liked_posts, class_name: "Post", join_table: "liked_posts"

  def name
    email.split("@").first.capitalize
  end
end
