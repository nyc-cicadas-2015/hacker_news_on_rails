class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    post = Post.find_by(id: params[:comment][:post])
    if logged_in?
      user = User.find_by(id: session[:user_id])
      user.comments.create(body: params[:comment][:body])
      redirect_to show_post_path(post)
    else
      flash[:error] = "Login to add comment"
      redirect_to new_session_path
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
