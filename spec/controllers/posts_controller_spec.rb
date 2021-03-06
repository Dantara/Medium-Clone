require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = User.create({email: "test@test.ru", first_name: "Dantara",
    second_name: "Power", password: "TestTest"})
  end

  describe "GET #new" do
    it "redirects when user not specified" do
      get :new
      expect(response).to redirect_to("/users/sign_in")
    end

    it "returns http success when user specified" do
      sign_in @user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
