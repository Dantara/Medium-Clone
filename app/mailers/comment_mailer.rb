class CommentMailer < ApplicationMailer
  def new
    @comment = params[:comment]
    @user = User.find(@comment.post.user_id)
    @commenter = User.find(@comment.user_id)
    @url = params[:url].delete_suffix! 'comments'
    make_bootstrap_mail(to: @user.email, subject: 'New comment on your post')
  end
end
