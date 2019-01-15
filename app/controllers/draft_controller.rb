class DraftController < ApplicationController
  before_action :authenticate_user!
  expose :post, parent: :current_user

  def show
  end
end
