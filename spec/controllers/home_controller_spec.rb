require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
   it "redirects when user not specified" do
     get :index
     expect(response).to redirect_to("/users/sign_in")
   end

  end

end
