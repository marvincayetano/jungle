require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should be successfully saved' do
      @category = Category.create(name: "New SZ")
      @product = Product.create(name: "Snoopshort", price: 20, quantity: 50, category_id: @category.id)
      expect(@product.errors.full_messages).to be_empty
    end

    it 'should have a name' do
      @category = Category.create(name: "New SZ")
      @product = Product.create(price: 20, quantity: 50, category_id: @category.id)
      expect(@product.name).to be_nil
      puts @product.errors.full_messages
    end

    it 'should have a price' do
      @category = Category.create(name: "New SZ")
      @product = Product.create(name: "Snoopshort", quantity: 50, category_id: @category.id)
      expect(@product.price).to be_nil
      puts @product.errors.full_messages
    end

    it 'should have a quantity' do
      @category = Category.create(name: "New SZ")
      @product = Product.create(name: "Snoopshort", quantity: 50, category_id: @category.id)
      expect(@product.price).to be_nil
      puts @product.errors.full_messages
    end

    it 'should have a category' do
      @product = Product.create(name: "Snoopshort", price: 20, quantity: 50)
      expect(@product.category_id).to be_nil
      puts @product.errors.full_messages
    end

  end
end
