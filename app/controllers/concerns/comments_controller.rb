class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    user = User.find_by(id: session[:user_id])
    post = Post.find_by(id: params[:comment][:post])
    post.comments.create(body: params[:comment][:body], user_id: user.id)
    redirect_to show_post_path(post)
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
