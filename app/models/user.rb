require "open-uri"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_one_attached :profile_picture

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
      # Rails.logger.debug("Provider data URL: #{provider_data.info}")
      # Attach the profile picture if URL is present and accessible
      if provider_data.info.image
        downloaded_image = URI.open(provider_data.info.image)
        user.profile_picture.attach(
          io: downloaded_image,
          filename: "profile_picture_#{provider_data.uid}.jpg",
          content_type: downloaded_image.content_type
        )
      end
    end
  end
end
