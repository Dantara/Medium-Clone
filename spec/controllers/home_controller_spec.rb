require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
   it "redirects when user not specified" do
     get :index
     expect(response).to have_http_status(:redirect)
   end
  end

end
