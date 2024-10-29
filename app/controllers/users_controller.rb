class UsersController < ApplicationController
  skip_before_action :set_user
  def index
    @users = User.all
  end
end
