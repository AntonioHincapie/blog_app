class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.new(author: current_user)
    @post.save
    redirect_to user_post_path(@post.author.id, @post.id)
  end
end
