class DraftController < ApplicationController
  before_action :authenticate_user!
  expose :post, scope: ->{ current_user.posts }

  def show
  end
end
