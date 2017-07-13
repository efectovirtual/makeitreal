require "my_ecommerce/version"
require "my_ecommerce/models/order"
require "my_ecommerce/models/customer"

module MyEcommerce
  class InvalidCouponError < StandardError ; end
end
