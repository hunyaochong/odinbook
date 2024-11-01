class UsersController < ApplicationController
  skip_before_action :set_user, only: [ :index ]
  def index
    @users = User.all
  end

  def show
  end
end
