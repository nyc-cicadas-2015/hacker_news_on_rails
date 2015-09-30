class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(posts_params)
    if post.save
      redirect_to show_post_path("#{post.id}")
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
  end

  def destroy
    user_id = session[:user_id]
    post = Post.find(params[:id])
    if user_id == current_user.id
      post.destroy
    end
    redirect_to posts_path
  end

  private
    def posts_params
      params.require(:post).permit(:title, :link)
    end

end
