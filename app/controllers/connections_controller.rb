class ConnectionsController < ApplicationController
  # skip_before_action :set_user
  # before_action :set_following_user, :set_follower_user

  # def create
  #   @connection = @following_user.connections.build(follower_id: @follower_user.id)
  #   # Connection.new(user_id: @following_user.id, follower_id: @follower_user.id)
  #   # logger.debug "New connection: #{@connection.attributes.inspect}"
  #   # logger.debug "Connection should be valid: #{@connection.valid?}"

  #   if @connection.save
  #     flash[:success] = "Successfully followed #{@following_user.name}"
  #     redirect_to users_path
  #   else
  #     flash[:error] = "Something went wrong"
  #     render "new", status: :unprocessable_entity
  #   end
  # end

  # private
  # def set_follower_user
  #   @follower_user = User.find(connection_params[:follower])
  # end

  # def set_following_user
  #   @following_user = User.find(connection_params[:following])
  # end

  # def connection_params
  #   params.permit(:follower, :following)
  # end
end
