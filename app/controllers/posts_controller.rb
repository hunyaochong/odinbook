class PostsController < ApplicationController
  before_action :set_post, only: [ :like ]

  # To add functionality to be only able to view people who the user follows.
  def index
    @posts = Post.all
    # To allow post to be created within the index page
    @post = @user.authored_posts.build
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

  def like
    if @user.liked_posts << @post
      flash[:success] = "Post successfully liked"
      redirect_to posts_path
    else
      render json: { success: false, message: "Failed to like post." }, status: :unprocessable_entity
    end
  end

  private
  def authored_post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
