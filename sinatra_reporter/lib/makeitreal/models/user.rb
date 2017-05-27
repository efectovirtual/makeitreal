module Makeitreal
  module Models
    class User < Person
      attr_accessor :role
      def initialize email, fullname, role
        @role = role
        super email, fullname
      end
    end
  end
end
