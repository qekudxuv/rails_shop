require 'test_helper'

class CartItemTest < ActiveSupport::TestCase

  test "cart item can calculate price" do
    cart = Cart.new
    p1 = Product.create(name:'ruby', price:100)
    p2 = Product.create(name:'diamond', price:50)

    5.times do
      cart.add_item(p1.id)
    end
    3.times do
      cart.add_item(p2.id)
    end

    assert_equal 500, cart.items.first.price
    assert_equal 150, cart.items.second.price
  end

end
