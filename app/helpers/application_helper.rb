module ApplicationHelper
  def user_profile_picture(user, size = 100)
    if user.profile_picture.attached?
      user.profile_picture.variant(resize_to_limit: [ size, size ])
    end
  end
end
