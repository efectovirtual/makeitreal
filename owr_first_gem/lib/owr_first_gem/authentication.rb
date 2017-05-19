require 'bcrypt'
module OwrFirstGem
  module Authentication

    include BCrypt
    class AuthenticationError < StandardError
    end

    def encrypt_password password
      @password = Password.create password
    end
  end
end
