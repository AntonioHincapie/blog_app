class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    values = params.require(:post).permit(:title, :text)
    @post = Post.new(author: current_user, title: values[:title], text: values[:text])

    if @post.save
      redirect_to users_path, notice: "Post has been published"
    else
      render :new
    end
  end
end
