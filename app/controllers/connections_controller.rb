class ConnectionsController < ApplicationController
  before_action :set_following_user

  def create
    @connection = Connection.new(following_id: @following_user.id, follower_id: @user.id)

    if @connection.save
      flash[:success] = "Successfully followed #{@following_user.name}"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      render "new", status: :unprocessable_entity
    end
  end

  private
  def set_following_user
    @following_user = User.find(connection_params[:following])
  end

  def connection_params
    params.permit(:following)
  end
end
