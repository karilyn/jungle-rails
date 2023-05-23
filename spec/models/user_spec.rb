require 'rails_helper'

RSpec.describe User, type: :model do
  # validation tests/examples here
  describe 'Validations' do
    it "saves successfully when all fields are valid" do
      @user = User.create(name: "Test Test", email: "test@test.com", password: "testing", password_confirmation: "testing")
      expect(@user).to be_valid
    end

    it "fails to save when name is not set" do
      @user = User.create(name: nil, email: "test@test.com", password: "testing", password_confirmation: "testing")
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end

end
