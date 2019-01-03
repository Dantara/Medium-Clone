class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :show_draft, :update, :destroy]

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

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def show_draft
  end

  def update
    @post.update(post_params)

    if params["commit"] == "Save as a post"
      @post.done = true
    else
      @post.done = false
    end

    @post.save
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to Rails.application.routes.recognize_path(request.referrer)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
