class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    post = Post.find_by(id: params[:comment][:post])
    post.comments.create(comments_params)
    redirect_to "/posts"
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
