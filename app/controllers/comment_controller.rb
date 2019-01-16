class CommentController < ApplicationController
  expose :post
  expose :comment, parent: :post

  def create
    comment.user_id = current_user.id
    comment.save

    redirect_to post_show_path(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
