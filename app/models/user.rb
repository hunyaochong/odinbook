class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: [ :google_oauth2 ]
  # devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  has_many :authored_posts, class_name: "Post", foreign_key: "author_id", dependent: :destroy

  has_and_belongs_to_many :liked_posts, class_name: "Post", join_table: "likes"

  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  has_many :connections
  has_many :followers, through: :connections, source: :follower, foreign_key: "following_id"
  has_many :followings, through: :connections, source: :following, foreign_key: "follower_id"

  def name
    email.split("@").first.capitalize
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
