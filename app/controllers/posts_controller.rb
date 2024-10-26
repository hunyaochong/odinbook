class PostsController < ApplicationController
  before_action :set_user

  # To add functionality to be only able to view people who the user follows.
  def index
    @posts = Post.all
  end

  def new
    @post = @user.authored_posts.build
  end

  def create
    @post = @user.authored_posts.build(authored_post_params)
    if @post.save
      flash[:success] = "Object successfully created"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      render "new", status: :unprocessible_entity
    end
  end

  private
  def set_user
    @user = current_user
  end

  def authored_post_params
    params.require(:post).permit(:body)
  end
end
