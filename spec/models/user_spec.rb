require 'rails_helper'

RSpec.describe User, type: :model do
  # validation tests/examples here
  describe 'Validations' do
    it "saves user successfully when all fields are valid" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user).to be_valid
    end

    it "fails to save when first name is not set" do
      user = User.create(
        first_name: nil,
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "fails to save when last name is not set" do
      user = User.create(
        first_name: "Test",
        last_name: nil,
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it "fails to save when email is not set" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: nil,
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "fails to save when password is not set" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: nil,
        password_confirmation: "testing"
      )
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "fails to save when password_confirmation is not set" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: nil
      )
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "fails to save when password and password_confirmation do not match" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing1"
      )
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "fails to save when password is shorter than six characters" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "fails to save when email is not unique" do
      user1 = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      user1.save!

      user2 = User.create(
        first_name: "Another",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates when credentials are valid" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )

      expect(User.authenticate_with_credentials("test@test.com", "testing")).to eq(user)
    end

    it "fails to authenticate when email is not valid" do
      auth = User.authenticate_with_credentials(
        nil,
        "testing"
      )
      expect(auth).to be_nil
    end

    it "fails to authenticate when password is not valid" do
      auth = User.authenticate_with_credentials(
        "test@test.com",
        nil
      )
      expect(auth).to be_nil
    end

    it "authenticates when email has leading or trailing spaces" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(User.authenticate_with_credentials(" test@test.com ", "testing")).to eq(user)
    end

    it "authenticates when email is in the wrong case" do
      user = User.create(
        first_name: "Test",
        last_name: "Test",
        email: "test@test.com",
        password: "testing",
        password_confirmation: "testing"
      )

      expect(User.authenticate_with_credentials("TEST@TEST.com", "testing")).to eq(user)
    end
  end
end
