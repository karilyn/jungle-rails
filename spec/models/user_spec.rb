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

    it "fails to save when email is not set" do
      @user = User.create(name: "Test Test", email: nil, password: "testing", password_confirmation: "testing")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "fails to save when password is not set" do
      @user = User.create(name: "Test Test", email: "test@test.com", password: nil, password_confirmation: "testing")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "fails to save when password_confirmation is not set" do
      @user = User.create(name: "Test Test", email: "test@test.com", password: "testing", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "fails to save when password and password_confirmation do not match" do
      @user = User.create(name: "Test Test", email: "test@test.com", password: "testing", password_confirmation: "testing1")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

end
