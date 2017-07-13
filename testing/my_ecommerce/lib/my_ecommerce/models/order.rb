module MyEcommerce
  module Models
    class Order
      attr_accessor :products
      def initialize
        @products = []
      end
      def total coupon = nil
        if coupon
          raise InvalidCouponError unless coupon[:code].start_with? 'C'
          raise InvalidCouponError if coupon[:discount].negative?
        end
        discount = coupon ? coupon[:discount] : 0
        order_total = @products.reduce 0 do |sum, product|
          sum += (product[:precio] * product[:cantidad])
        end
        order_total -= (order_total * (discount / 100.0))
      end
    end
  end
end
