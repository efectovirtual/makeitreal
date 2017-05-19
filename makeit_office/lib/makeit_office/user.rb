module MakeitOffice
  class User
    include Authentication
    def initialize name, email, password
      @name = name
      @email = email
      encrypt_password password
    end

    def self.login! user, password
      raise AuthenticationError.new('password does not match') unless user.password == password
      user
    end
  end
end
