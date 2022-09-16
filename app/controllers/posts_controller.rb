class PostsController < ApplicationController
  def index
    def index
      @posts = Post.where(author_id: params[:user_id])
    end

    def show
      @post = Post.find(params[:id])
    end
  end
end
