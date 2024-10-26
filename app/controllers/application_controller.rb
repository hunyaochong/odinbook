class ApplicationController < ActionController::Base
  before_action :set_user
  before_action :authenticate_user!

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private
  def set_user
    @user = current_user
  end
end
