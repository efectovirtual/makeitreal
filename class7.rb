# =============================================================================
# module Greetings
#   def hello
#     "Hello!"
#   end

#   def bonjour
#     "Bonjour!"
#   end

#   def hola
#     "Hola!"
#   end

#   def hello_with_name
#     "#{hello} #{name}"
#   end

#   def self.bye
#     "Bye Bye"
#   end
# end

# class Persona
#   include Greetings
#   attr_reader :name, :email, :cc
#   def initialize name, email, cc
#     @name = name
#     @email = email
#     @cc = cc
#   end
# end

# =============================================================================
# module Greetings
#   def hello
#     "Hello!"
#   end

#   def bonjour
#     "Bonjour!"
#   end

#   def hola
#     "Hola!"
#   end
# end

# class Persona
#   extend Greetings
#   attr_reader :name, :email, :cc
#   def initialize name, email, cc
#     @name = name
#     @email = email
#     @cc = cc
#   end
# end
# =============================================================================
# ejercicio: crear un modulo Inject que agreguen un metodo sum y un metodo prod
# los cuales sumaras y multiplicaran todos los elementos de un arreglo respectivamente
# module Inject
#   def inject(n)
#     each do |value| # self.each do |value|
#       n = yield(n, value)
#     end
#     n
#   end
#   def sum(initial = 0)
#     inject(initial) { |acum, value| acum + value }
#   end
#   def prod(initial = 1)
#     inject(initial) { |acum, value| acum * value }
#   end
# end

# class Array
#   include Inject
# end
# [ 1, 2, 3, 4, 5 ].sum
# [ 1, 2, 3, 4, 5 ].prod

# =============================================================================
# class Song
#   include Comparable

#   attr_reader :duration
#   def initialize name, author, duration
#     @name = name
#     @author = author
#     @duration = duration
#   end
#   def <=>(other)
#     @duration <=> other.duration
#   end
# end
# song1 = Song.new("My Way",  "Sinatra", 225)
# song2 = Song.new("Bicylops", "Fleck",  260)

# song1 <=> song2
# song1  <  song2
# song1 ==  song1
# song1  >  song2

# =============================================================================
# class MakeItReal
#   attr_accessor :estudiantes
#   def initialize
#     @estudiantes = []
#   end
# end

# makeit = MakeItReal.new
# makeit.estudiantes << 1
# makeit.estudiantes << 2
# makeit.estudiantes << 3
# makeit.estudiantes << 4
# makeit.estudiantes << 5
# makeit.sort
# makeit.max
# makeit.min

# class MakeItReal
#   include Enumerable

#   attr_accessor :estudiantes
#   def initialize
#     @estudiantes = []
#   end

#   def each
#     @estudiantes.each do |estudiante|
#       yield estudiante
#     end
#   end
# end
# =============================================================================
# ejercicio hacer un modulo de authenticacion que contenga los siguientes
# 1) encryptar contraseña y debe retornat un string
# 2) login con email y contraseña debe retornar true si ambas coinciden, de lo contrario debe retornar false
# 3) crea una clase usuario que incluya el modulo authenticacion
# =============================================================================
# require 'bcrypt'
# module Autheticacion
#   def self.included base
#     base.include IntanceMethods
#     base.extend ClassMethods
#   end

#   module IntanceMethods
#     include BCrypt
#     def password
#       @password
#     end

#     def encrypt_password password
#       @password = Password.create(password)
#     end
#   end

#   module ClassMethods
#     def login? user, password
#       user.password == password
#     end
#   end
# end

# class Customer
#   include Autheticacion
#   attr_reader :email
#   def initialize email, password
#     @email = email
#     encrypt_password password
#   end
# end

# simon = Customer.new 'simon@ex.com', '123456'
# simon.password
# Customer.login? simon, '123456'
# Customer.login? simon, '1234'
# simon.password.class
# simon.password.method(:==)
# simon.password.method(:==).source_location
# =============================================================================

# module Mod
#   def greet

#   end
# end
# module Mod
#   def self.greet

#   end
# end

# class Greeter
#   extend Mod
# end

# module Mod2
#   def self.greet
#   end

#   def hey
#   end
# end

# class Greeter2
#   include Mod2
#   extend Mod2
# end

module Greeting
  PI=3.1416
  def hola
    'hola'
  end

  def hello
    'hello'
  end

  def bonjour
    'bonjour'
  end

  def hello_with_name
    "Hello #{@name}"
  end
end

class Persona
  extend Greeting
  attr_reader :name, :email
  def initialize name, email
    @name = name
    @email = email
  end

  def area_circulo radio
    PI * (radio ** 2)
  end
end

module GreetingClass
  def hola
    'hola'
  end

  def hello
    'hello'
  end

  def bonjour
    'bonjour'
  end

  def hola_with_class
    'Spr. hola'
  end
end

class PersonaClass
  extend GreetingClass
  attr_reader :name, :email
  def initialize name, email
    @name = name
    @email = email
  end
end


module Drawable
  def draw
    puts "#{name}"
  end

  def canvas figura
    puts figura
  end
end

class Figura
  include Drawable
  extend Drawable
  attr_reader :name

  def initialize name
    @name = name
  end
end

# =============================================================================
# ejercicio: crear un modulo Inject que agreguen un metodo sum y un
# metodo prod los cuales sumaras y multiplicaran todos los elementos
# de un arreglo respectivamente
[ 1, 2, 3, 4, 5 ].sum
[ 1, 2, 3, 4, 5 ].prod

# ejercicio: agregarle la siguiente funcionalidad a la clase MakeItReal
class MakeItReal
  include Enumerable
  attr_accessor :estudiantes
  def initialize
    @estudiantes = []
  end

  def each
    @estudiantes.each do |estudiante|
      yield estudiante
    end
  end
end

makeit = MakeItReal.new
makeit.estudiantes << 3
makeit.estudiantes << 1
makeit.estudiantes << 4
makeit.estudiantes << 2
makeit.estudiantes << 5
makeit.sort # 1,2,3,4,5
makeit.max # 5
makeit.min # 1

class Order
  include Enumerable
  attr_accessor :products
  def initialize
    @products = []
  end

  def each
    @products.each do |product|
      yield product
    end
  end

  def total
    sum = 0
    self.each do |product|
      sum += product[:price]
    end
    sum
  end
end

order = Order.new
order.products << {name: '', price: 4000}
order.products << {name: '', price: 2000}
order.products << {name: '', price: 3000}
order.products << {name: '', price: 2000}
order.products << {name: '', price: 7000}
order.sort_by { |product| product[:price] }
order.max_by { |product| product[:price] }
order.min_by { |product| product[:price] }


class Song
  include Comparable
  attr_reader :duration
  def initialize name, duration
    @name = name
    @duration = duration
  end

  def <=> other_song
    @duration <=> other_song.duration
  end
end

song1 = Song.new 'La Camisa Negra', 3.40
song2 = Song.new 'Despacito', 2.90

song1 > song2 # song1.> song2

# ejercicio hacer un modulo de authenticacion que contenga los siguientes
# 1) encryptar contraseña y debe retornat un string
# 2) login con email y contraseña debe retornar true si ambas coinciden,
# de lo contrario debe retornar false
# 3) crea una clase usuario que incluya el modulo authenticacion
#
require 'bcrypt'
module Authentication
  include BCrypt

  def self.included mod
    puts "#{self} included in #{mod}"
    mod.extend ClassMethods
  end

  def password
    @password
  end

  def encrypt_password password
    @password = Password.create password
  end

  module ClassMethods
    def login? user, password
      user.password == password
    end
  end
end

class Customer
  include Authentication
  attr_reader :email
  def initialize email, password
    @email = email
    encrypt_password password
  end
end

mateo = Customer.new 'mateo@example.com', '1234567890'
mateo.password #contraseña cifrada
Customer.login? mateo, '13244' # false
Customer.login? mateo, '1234567890' # true

module Order
  class Customer
  end
end

module Authentication
  class Customer
  end
end
