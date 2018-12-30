require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    user_params = {email: "test@mail.ru", first_name: "Ivan",
      second_name: "Ivanov", password: "IvanIvanov"}

    @user = User.create(user_params)
  end

  it "is valid with params" do
    post_params = {title: "Test", text: "Some simple text", done: true}

    expect(@user.posts.new(post_params)).to be_valid
  end

  it "is invalid without params" do
    expect(Post.new).to_not be_valid
  end
end
