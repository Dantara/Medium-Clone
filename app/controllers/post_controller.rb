class PostController < ApplicationController
  before_action :authenticate_user!
  expose :post, scope: ->{ current_user.posts }
  expose :comment, fetch: ->{ Comment.new }
  expose :comments, fetch: ->{ Comment.where(post_id: post.id) }

  def new
  end

  def create
    if params["commit"] == "Create Post"
      post.done = true
    else
      post.done = false
    end

    post.save
    redirect_to root_path
  end

  def show
    p post
  end

  def show_draft
  end

  def update
    post.update(post_params)

    if params["commit"] == "Save as a post"
      post.done = true
    else
      post.done = false
    end

    post.save
    redirect_to root_path
  end

  def destroy
    post.destroy
    redirect_to Rails.application.routes.recognize_path(request.referrer)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
