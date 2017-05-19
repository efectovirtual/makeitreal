require 'bcrypt'

module MakeitOffice
  module Authentication
    include BCrypt
    class AuthenticationError < StandardError
    end

    def password
      @password
    end

    def encrypt_password password
      @password = Password.create password
    end
  end
end
