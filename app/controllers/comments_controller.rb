class CommentsController < ApplicationController
  expose :post, id: -> { params["comment"]["post_id"] }
  expose :comment, parent: :post

  def create
    comment.user_id = current_user.id
    comment.save

    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
