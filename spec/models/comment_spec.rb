require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    user_params = {email: "test@mail.ru", first_name: "Ivan",
      second_name: "Ivanov", password: "IvanIvanov"}
    post_params = {title: "Test", text: "Some simple text", done: true}

    @user = User.create(user_params)
    @post = @user.posts.create(post_params)
  end

  it "is valid with params" do
    comment_params = {text: "Test", user_id: @user.id, post_id: @post.id}
    expect(Comment.new(comment_params)).to be_valid
  end

  it "is invalid without params" do
    expect(Comment.new).to_not be_valid
  end
end
