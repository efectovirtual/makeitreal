module Company
  module Models
    class User < Person
      attr_accessor :role
      def initialize attrs
        @role = attrs[:role]
        super attrs
      end
    end
  end
end
