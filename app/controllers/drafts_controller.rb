class DraftsController < ApplicationController
  before_action :authenticate_user!
  expose :post, parent: :current_user

  def index
    @drafts = current_user.drafts
  end

  def show
  end

  def destroy
    post.destroy
    redirect_back fallback_location: root_path
  end

end
