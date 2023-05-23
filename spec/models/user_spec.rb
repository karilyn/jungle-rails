require 'rails_helper'

RSpec.describe User, type: :model do
  # validation tests/examples here
  it "saves successfully when all fields are set" do
    @user = User.create(first_name: "Test", last_name: "Test", email: "test@test.com", password: "test", password_confirmation: "test")
    expect(@user).to be_valid
  end
end
