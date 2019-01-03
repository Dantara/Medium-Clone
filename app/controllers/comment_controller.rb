class CommentController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:id]
    @comment.user_id = current_user.id
    @comment.save

    redirect_to post_show_path(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
