require 'test_helper'

class CustomerTest < Minitest::Test
  def test_customer_model_should_exist
    customer = MyEcommerce::Models::Customer.new 'myemail@ex.com'
    refute_nil customer
  end

  def test_it_should_find_a_customer_by_email
    my_customer = MyEcommerce::Models::Customer.new 'email@ex.com'
    customer = MyEcommerce::Models::Customer.find 'email@ex.com'
    refute_nil customer
  end

  def test_it_should_not_find_a_customer_by_email
    customer = MyEcommerce::Models::Customer.find 'fakeemail@ex.com'
    assert_nil customer
  end
end
