# =============================================================================
# http://blog.honeybadger.io/ruby-exception-vs-standarderror-whats-the-difference/
# NUNCA hagan lo siguiente, NUNCA le hagan rescue a un Exception
# SignalException::Interrupt - If you rescue this, you can't exit your app by hitting control-c.
# ScriptError::SyntaxError - Swallowing syntax errors means that things like puts("Forgot something) will fail silently.
# NoMemoryError - Wanna know what happens when your program keeps running after it uses up all the RAM? Me neither.
# begin
#   do_something()
# rescue Exception => e
#   # Don't do this. This will swallow every single exception. Nothing gets past it.
# end
# Pero pueden hacer lo siguiente
# begin
#   do_something()
# rescue StandardError => e
#   # Only your app's exceptions are swallowed. Things like SyntaxErrror are left alone.
# end
# O esto
# begin
#   do_something()
# rescue => e
#   # This is the same as rescuing StandardError
# end
# Custom Exceptions deben heredar de StandardError

# ejercicio: van hacer una app que pregunte al usuario si desea aceptar, coja el input
# pregunte si es un y/n, si es un y o un n devuelva true, de lo contrario imprimira un custom error
# eh intentara pedir el input otras 3 veces
# class NotYesOrNoError < StandardError
# end

# def promt
#   print '> desea aceptar(y/n)'
# end

# def get_text
#   gets.chomp
# end

# def yes_or_no? text
#   if text == 'y' || text == 'n'
#     true
#   else
#     raise NotYesOrNoError.new("we expect y/n and you enter: #{text}")
#   end
# end

# retries = 0
# begin
#   promt
#   text = get_text
#   yes_or_no? text
# rescue NotYesOrNoError => e
#   puts "Error #{e}"
#   if retries < 3
#     retries += 1
#     retry
#   end
# end

# =============================================================================
# ejercicio van a crear un namespace DB el cual va a contener un custom error UserNotFoundError
# y una clase usuario, la clase usuario tendra un un arreglo de usuarios estatico que representara una
# base de datos y tendra un metodo save para guardar usuarios dentro de este arrelglo, a su vez
# tendra un metodo estatico find email que servira para encontrar un usuario dentro del arreglo
# de usuarios por email, cuando un usuario no pueda ser encontrato el metodo debe lanzar UserNotFoundError
# de lo contrario debe retornar un usuario
# module DB
#   class UserNotFoundError < StandardError
#   end

#   class Usuario
#     @@usuarios = []
#     attr_reader :email, :password
#     def initialize email, password
#       @email = email
#       @password = password
#     end

#     def save
#       @@usuarios << self
#     end

#     def self.find email
#       user = @@usuarios.find { |usuario| usuario.email == email }
#       raise UserNotFoundError.new "user with email=#{email} does not exist" unless user
#       user
#     end
#   end
# end

# user1 = DB::Usuario.new 'mat@ex.com', '1234567890'
# user2 = DB::Usuario.new 'jess@ex.com', '1234567890'
# user3 = DB::Usuario.new 'simon@ex.com', '1234567890'

# user1.save
# user2.save
# user3.save

# begin
#   DB::Usuario.find 'mat@ex.com'
# rescue DB::UserNotFoundError => e
#   puts "ERROR #{e}"
# end

# begin
#   DB::Usuario.find 'yep@ex.com'
# rescue DB::UserNotFoundError => e
#   puts "ERROR #{e}"
# end

# =============================================================================
# Ejercicio dado el ejemplo anterior cree un namespase Authenticacion que contenga un custom error llamado
# UnAuthorizedError y un modulo de Auth este modulo tendra un metodo estatico llamado authenticate! el cual
# recibira un user con un attributo password y un password si los password coinciden el metodo
# retornara el mismo user, de lo contrario lanzara UnAuthorizedError,
# module Authetication
#   class UnAuthorizedError < StandardError
#   end

#   module Auth
#     def self.authenticate! user, password
#       if user.password == password
#         user
#       else
#         raise UnAuthorizedError.new "password does not match"
#       end
#     end
#   end
# end

# user1 = DB::Usuario.new 'mat@ex.com', '1234567890'
# user2 = DB::Usuario.new 'jess@ex.com', '1234567890'
# user3 = DB::Usuario.new 'simon@ex.com', '1234567890'
# user1.save
# user2.save
# user3.save
# begin
#   user = DB::Usuario.find 'mat@ex.com'
#   Authetication::Auth.authenticate! user, '1234567890'
# rescue DB::UserNotFoundError => e
#   puts "ERROR #{e}"
# rescue Authetication::UnAuthorizedError => e
#   puts "ERROR #{e}"
# end

# =============================================================================
# file = File.open("custom.file")
# begin
#   while line = file.readline
#     puts line
#   end
# rescue EOFError => e
#   puts "ERROR #{e}"
# ensure
#   puts "closing file"
#   file.close unless file.nil?
# end

module Ventas
  PI='hola'
  class Customer
    def initialize name, orders
      @name = name
      @orders = orders
    end
  end
end

module Seguros
  PI=68
  class Customer
    def initialize name, period
      @name = name
      @period = period
    end
  end
  def hola
    'hola'
  end
end

class Order
  include Ventas
  include Seguros
  attr_reader :products
  def initialize products
    @products = products
  end
  def self.PI
    # Ventas::PI
    PI
  end
end

class Order
  attr_reader :details
  def initialize details
    @details = details
  end
end

# Errores
raise 'Hola como estan'
raise StandardError.new 'Hello class'
raise StandardError, 'Hola'
fail 'Falle al escribir'

class MyCustomError < StandardError
end
def it_will_blow_up
  # raise 'Me explote'
  # 6 / 0
  raise MyCustomError.new 'Fallo un condicional'
end

begin
  # it_will_blow_up
  text = gets.chomp
  if text == 'incorrect'
    raise MyCustomError.new "No esperaba #{text} esperaba correct"
  end
rescue RuntimeError => error
  puts "RUNTIME_ERROR=#{error.message} #{error.backtrace}"
rescue MyCustomError => error
  puts "MY_CUSTOM_ERROR=#{error}"
else
  puts "seguimos normal"
end



def open_file file
  File.open file
end

def printer file
  while line = file.readline
    puts "LINE = #{line}"
  end
end

file_name = gets.chomp
file = open_file file_name
begin
  printer file
rescue EOFError => error
  puts "Ya llegamos al final del archivo #{error}"
ensure
  puts "closing file"
  file.close
end



# ejercicio: van hacer una app que pregunte al usuario si desea aceptar,
# coja el input pregunte si es un y/n, si es un y o un n devuelva true,
# de lo contrario imprimira un custom error eh intentara pedir el
# input otras 3 veces
class NotYesOrNoError < StandardError
end
def promt
  print '> desea aceptar(y/n)'
end
def get_text
  gets.chomp
end
def yes_or_no? text
  if text == 'y' || text == 'n'
    true
  else
    raise NotYesOrNoError.new("we expect y/n and you enter: #{text}")
  end
end

retries = 0
begin
  promt
  text = get_text
  yes_or_no? text
rescue NotYesOrNoError => e
  puts "Error #{e}"
  if retries < 3
    retries += 1
    retry
  end
end

# ejercicio van a crear un namespace DB el cual va a contener un custom
# error UserNotFoundError y una clase usuario, la clase usuario tendra
# un un arreglo de usuarios estatico que representara una
# base de datos y tendra un metodo save para guardar usuarios
# dentro de este arrelglo, a su vez
# tendra un metodo estatico find email que servira para encontrar un
#  usuario dentro del arreglo
# de usuarios por email, cuando un usuario no pueda ser encontrato
# el metodo debe lanzar UserNotFoundError
# de lo contrario debe retornar un usuario

module DB
  class UserNotFoundError < StandardError
  end

  class Usuario
    @@usuarios = []

    attr_reader :email
    def initialize email
      @email = email
    end


    def save
      @@usuarios << self
      self.email
      @email
      email
    end

    def self.find email
      usuario = @@usuarios.find { |usuario| usuario.email == email }
      raise UserNotFoundError.new "user with email=#{email} does not exist" unless usuario
      usuario
    end
  end
end

begin
  DB::Usuario.find 'yep@ex.com'
rescue DB::UserNotFoundError => e
  puts "ERROR #{e}"
end


