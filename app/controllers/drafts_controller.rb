class DraftsController < ApplicationController
  before_action :authenticate_user!
  expose :post, parent: :current_user

  def index
    @drafts = Draft.where(done: false, user_id: current_user.id)
  end

  def show
  end

  def destroy
    post.destroy
    redirect_back fallback_location: root_path
  end

end
