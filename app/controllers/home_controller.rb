class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all_visible
  end

  def drafts
    @posts = Post.where(done: false, user_id: current_user.id)
  end

end
