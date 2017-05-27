module Makeitreal
  module Models
    class Person
      attr_accessor :email, :fullname
      def initialize email, fullname
        @email, @fullname = email, fullname
      end
    end
  end
end
