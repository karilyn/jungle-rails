require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "saves successfully when all fields are set" do
      category = Category.create(name: "Test")
      product = Product.create(name: "Test", price: 100, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it "fails to save when name is not set" do
      category = Category.create(name: "Test")
      product = Product.create(name: nil, price: 100, quantity: 1, category: category)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "fails to save when price is not set" do
      category = Category.create(name: "Test")
      product = Product.create(name: "Test", price: nil, quantity: 1, category: category)
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "fails to save when quantity is not set" do
      category = Category.create(name: "Test")
      product = Product.create(name: "Test", price: 100, quantity: nil, category: category)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "fails to save when category is not set" do
      category = Category.create(name: "Test")
      product = Product.create(name: "Test", price: 100, quantity: 1, category: nil)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
