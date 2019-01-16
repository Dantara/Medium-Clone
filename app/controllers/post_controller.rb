class PostController < ApplicationController
  before_action :authenticate_user!
  expose :post, parent: :current_user
  expose :comment
  expose :comments, from: :post

  def new
  end

  def create
    post.done = params["commit"] == "Create Post"
    post.save

    redirect_to root_path
  end

  def show
  end

  def update
    post.update(post_params)
    post.done = params["commit"] == "Save as a post"
    post.save

    redirect_to root_path
  end

  def destroy
    post.destroy
    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end

