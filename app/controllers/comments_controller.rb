class CommentsController < ApplicationController
  before_action :set_post
  layout :resolve_layout

  def index
    @comments = @post.comments.all.sort_by_recency
    @comment = @post.comments.build
  end

  def new
    Rails.logger.info("Entered comments new method")
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Object successfully created"
      redirect_to post_comments_path(@post)
    else
      flash[:error] = "Something went wrong"
      render "new", status: :unprocessible_entity
    end
  end


  private
  def resolve_layout
    action_name == "index" ? "user_profile" : "application"
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
