require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with params" do
    params = {email: "test@mail.ru", first_name: "Ivan",
    second_name: "Ivanov", password: "IvanIvanov"}

    expect(User.new(params)).to be_valid
  end

  it "is invalid without params" do
    expect(User.new).to_not be_valid
  end
end
