class CommentsController < ApplicationController
  before_action :authenticate_user!
  expose :post
  expose :comment, parent: :post

  def create
    comment.save
    CommentMailer.with(comment: comment, url: request.original_url).new.deliver_now
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
