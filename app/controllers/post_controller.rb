class PostController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if params["commit"] == "Create Post"
      @post.done = true
    else
      @post.done = false
    end

    @post.save
    redirect_to root_path
  end

  private

  def post_params

    params.require(:post).permit(:title, :text)
  end

end
