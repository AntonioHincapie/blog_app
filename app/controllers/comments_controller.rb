class CommentsController < ApplicationController
  def new
    @comment= Comment.new
  end

  def create
    values = params.require(:comment).permit(:text)
    @comment = Comment.new(text: values[:text], author_id: current_user.id, post_id: params[:post_id])

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: "Comment has been published"
    else
      render :new
    end
  end
end
