module MyEcommerce
  module Models
    class Customer
      attr_accessor :email
      @@customers = []

      def initialize email
        @email = email
        @@customers.push self
      end

      def self.find email
        @@customers.find { |customer| customer.email == email }
      end
    end
  end
end
