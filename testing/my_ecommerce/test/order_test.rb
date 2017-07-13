require 'test_helper'

class OrderTest < Minitest::Test
  def test_order_model_should_exist
    order = MyEcommerce::Models::Order.new
    refute_nil order
  end

  def test_an_empty_order_should_return_0_as_total
    order = MyEcommerce::Models::Order.new
    assert_equal order.total, 0
  end

  def test_an_order_with_one_product_should_return_a_correct_total
    order = MyEcommerce::Models::Order.new
    order.products.push({name: 'audifonos', precio: 1000, cantidad: 1})
    assert_equal order.total, 1000
  end

  def test_an_order_with_multiple_products_should_return_a_correct_total
    order = MyEcommerce::Models::Order.new
    order.products.push({name: 'audifonos', precio: 1000, cantidad: 1})
    order.products.push({name: 'medias', precio: 3000, cantidad: 5})
    assert_equal order.total, 16000
  end

  def test_it_should_apply_a_discount_of_0_to_order
    order = MyEcommerce::Models::Order.new
    order.products.push({name: 'audifonos', precio: 1000, cantidad: 1})
    order.products.push({name: 'medias', precio: 3000, cantidad: 5})
    assert_equal order.total({code: 'C_random', discount: 0}), 16000
  end

  def test_it_should_apply_a_discount_of_50_to_order
    order = MyEcommerce::Models::Order.new
    order.products.push({name: 'audifonos', precio: 1000, cantidad: 1})
    order.products.push({name: 'medias', precio: 3000, cantidad: 5})
    assert_equal order.total({code: 'C_random', discount: 50}), 8000
  end

  def test_it_should_apply_a_discount_of_100_to_order
    order = MyEcommerce::Models::Order.new
    order.products.push({name: 'audifonos', precio: 1000, cantidad: 1})
    order.products.push({name: 'medias', precio: 3000, cantidad: 5})
    assert_equal order.total({code: 'C_random', discount: 100}), 0
  end

  def test_it_should_raise_an_error_if_coupon_code_does_not_start_with_C
    order = MyEcommerce::Models::Order.new
    assert_raises(MyEcommerce::InvalidCouponError) {
      order.total({code: 'D_random', discount: 100})
    }
  end

  def test_it_should_raise_an_error_if_coupon_discount_is_negative
    order = MyEcommerce::Models::Order.new
    assert_raises(MyEcommerce::InvalidCouponError) {
      order.total({code: 'C_random', discount: -100})
    }
  end
end
