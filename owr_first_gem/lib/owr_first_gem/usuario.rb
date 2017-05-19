require "owr_first_gem/authentication"
module OwrFirstGem
  class Usuario
    include Authentication

    attr_reader :password
    def initialize password
      encrypt_password password
    end
  end
end
