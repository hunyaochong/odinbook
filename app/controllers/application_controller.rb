class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :set_layout

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private
  def set_user
    @user = current_user
  end

  def set_layout
    user_signed_in? ? "application" : "user_setup"
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :profile_picture ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :profile_picture ])
  end
end
