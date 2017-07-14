module Company
  module Models
    class Person
      attr_accessor :email, :full_name
      def initialize attrs = {}
        @email = attrs[:email]
        @full_name = attrs[:full_name]
      end
    end
  end
end
