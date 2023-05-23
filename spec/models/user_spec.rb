require 'rails_helper'

RSpec.describe User, type: :model do
  # validation tests/examples here
  describe 'Validations' do
    it "saves successfully when all fields are valid" do
      @user = User.create(first_name: "Test", last_name: "Test", email: "test@test.com", password: "testing", password_confirmation: "testing")
      expect(@user).to be_valid
    end

    it "fails to save when first name is not set" do
      @user = User.create(first_name: nil, last_name: "Test", email: "test@test.com", password: "testing", password_confirmation: "testing")
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "fails to save when last name is not set" do
      @user = User.create(first_name: "Test", last_name: nil, email: "test@test.com", password: "testing", password_confirmation: "testing")
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

  describe '.authenticate_with_credentials' do
    it "authenticates when credentials are valid" do
      auth = User.authenticate_with_credentials(email: "test@test.com", password: "testing")
      expect(auth).to be_valid
    end

    it "fails to authenticate when email is not valid" do
      auth = User.authenticate_with_credentials(email: nil, password: "testing")
      expect(auth).to be_nil
    end

    it "fails to authenticate when password is not valid" do
      auth = User.authenticate_with_credentials(email: "test@test.com", password: nil)
      expect(auth).to be_nil
    end

    it "authenticates when email has leading or trailing spaces" do
      auth = User.authenticate_with_credentials(email: " test@test.com ", password: "testing")
      expect(auth).to be_valid
    end

    it "authenticates when email is in the wrong case" do
      auth = User.authenticate_with_credentials(email: "TEST@test.com", password: "testing")
      expect(auth).to be_valid
    end



  end
end
