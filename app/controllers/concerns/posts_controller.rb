class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(posts_params)
    if post.save
      redirect_to "/posts/#{post.id}"
    else
      redirect_to "/posts/new"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
  end

  private
    def posts_params
      params.require(:post).permit(:title, :link)
    end

end
