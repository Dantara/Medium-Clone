class CommentMailer < ApplicationMailer
  def new
    @comment = params[:comment]
    @user = User.find(@comment.post.user_id)
    mail(to: @user.email, subject: 'New comment on your post')
  end
end
