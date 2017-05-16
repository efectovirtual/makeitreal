class Person
  def initialize name, last_name
    @name = name
    @last_name = last_name
  end

  def name
    @name
  end

  def name= other
    @name = other
  end

  def last_name
    @last_name
  end

  def last_name= other
    @last_name = other
  end

  def full_name
    "#{name} #{last_name}"
  end
end

class Person
  attr_reader :name, :last_name
  attr_writer :name, :last_name
  COUNTRY='US'

  def initialize name, last_name
    @name = name
    @last_name = last_name
  end

  def full_name
    "#{name} #{last_name}"
  end
end

# Class Attributes
# Atributos de Clase
class PasswordGenerator
  def self.generate
    'very secure password #YOLO'
  end
end

class Classroom
  @@estudents = []
  def initialize
  end

  def add_student student
    @@estudents << student
  end

  def self.find student
    @@estudents.find { |e| e == student }
  end
end

# Ejercicios
# Implemente una clase Orden la cual contiene un arreglo de productos (sea productos un arreglo de strings), implemente un metodo para acceder a sus productos, agregar productos y eliminar productos

# Vamos a definir figuras geometricas como clases, las cuales tienen un area, perimetro y un numero de lados
# Trianguro, Circunferencia, Rectangulo, Cuadrado

# Construir los objetos y relaciones que componen un blackjack (sin logica)
# Carta
# Deck
# Jugador
# Mano
# Juego

# Carta
# Deck has_many Cartas
# Jugador has_one Mano
# Mano has_many Cartas
# Juego has_one Deck
# Juego has_many Jugador

class Persona
  def say_hello name
    puts "Hello my friend #{name}"
  end

  # static
  def self.say_bye name
    puts "Bye my friend #{name}"
  end

  def get_secure_password
    password
  end

  private
    def password
      puts "you can see my password"
    end

    public def esto_es_privado
      puts "yayayaya"
    end
end


class Student
  def initialize name, last_name, class_room
    @name = name
    @last_name = last_name
    @class_room = class_room
  end

  def name
    @name.upcase
  end

  def class_room
    @class_room
  end

  def full_name
    "#{name} #{@last_name}"
  end

  def self.say_hello
    @last_name
  end
  def self.hola
    @last_name = 'gallego'
  end
end

class ClassRoom
  @@students = []
  COUNTRY='US'

  attr_reader :direccion
  attr_writer :telefono
  attr_accessor :salon

  def initialize salon = 'coeco'
    @salon = salon
  end

  def salon
    @salon.upcase
  end

  def add_student student
    @@students << student
  end

  def self.find student
    @@students.find { |e| e == student }
  end

  def self.students
    @@students
  end
end

# Implemente una clase Orden la cual contiene un arreglo
# de productos (sea productos un arreglo de strings), '
# implemente un metodo para acceder a sus productos,
# agregar productos y eliminar productos

class Order
  attr_accessor :products
  def initialize
    @products = []
  end

  def add_product product
    @products << product
  end

  def delete_product product
    @products.delete product
  end

  def find_product product
    @products.find { |p| p == product }
  end
end

# Construir los objetos y relaciones que componen un
# blackjack (sin logica)
# Carta
# Deck
# Jugador
# Mano
# Juego
#
# Deck has_many Cartas
# Jugador has_one Mano
# Mano has_many Cartas
# Juego has_one Deck
# Juego has_many Jugador
as_cor = Carta.new
deck = Deck.new [as_cor, as_tre...]
mano1 = deck.generar_mano
mano2 = deck.generar_mano
jugador1 = Jugador.new 'simon', mano1
jugador2 = Jugador.new 'santiago', mano2
juego = Juego.new deck, [jugador1, jugador2]
class Deck
  attr_accessor :cartas
end

class Deck
  attr_reader :mazo
  def initialize
    @mazo = []
    1.upto 4 do |i|
      1.upto 13 do |j|
        if j == 1
          @mazo << Carta.new('A',i)
        elsif j == 11
          @mazo << Carta.new('J',i)
        elsif j == 12
          @mazo << Carta.new('Q',i)
        elsif j == 13
          @mazo << Carta.new('K',i)
        else
          @mazo << Carta.new(j,i)
        end
      end
    end
  end
end
