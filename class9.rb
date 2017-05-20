# # coja 2 numeros del input del usuario, dividalos y capture el ZeroDivisionError
# # si ocurre y muestre un mensaje de error, haga esto hasta que el usuario copie exit
# def get_text prompt
#   print "$ #{prompt} "
#   text = gets.chomp
# end
# loop do
#   begin
#     text = get_text
#     break if text == 'exit'
#     numero1 = text.to_i
#     text = get_text
#     break if text == 'exit'
#     numero2 = text.to_i
#     puts("> #{numero1 / numero2}")
#   rescue ZeroDivisionError => e
#     puts "Error dividiendo por 0"
#   end
# end
# # vamos hacer un command line application que va a pedir el nombre del usuario,
# # si es vacio debe lanzar EmptyNameError, tambien pedira la edad del usuario y
# # si es menor que 18 debe lanzar Under18Error o un ArgumentError si no es un numero
# class EmptyNameError < StandardError
# end
# class Under18Error < StandardError
# end
# def get_info
#   nombre = get_text 'nombre'
#   raise EmptyNameError.new('nombre no puede estar vacio') if nombre.strip.empty?
#   edad = Integer(get_text 'edad')
#   raise Under18Error.new('edad no puede ser menor de 18') if edad < 18
#   puts "success"
# end



# # defina 2 namspaces Gym y Dojo los cuales dentran una clase Push con un metodo de instancia up
# # este metodo debe retornar diferente uno del otro

# # dado el siguiente modulo devuelva la constante A dentro del
# # metodo de instancia push en la clase ScopeIn
# module Dojo
#   A = 4
#   module Kata
#     module Roulette
#       class ScopeIn
#         def push
#           A
#         end
#       end
#     end
#   end
# end

# # dado el siguiente modulo devuelva la constante A = 10 dentro del
# # metodo de instancia push en la clase ScopeIn y la constante A = 7 dentro del
# # metodo de instancia push_less en la misma clase
# module Dojo
#   A = 10
#   module Kata
#     A = 7
#     class ScopeIn
#       def push
#         Dojo::A
#       end
#       def push_less
#         A
#       end
#     end
#   end
# end

# # dado una clase Mazo con un arreglo estatico de cartas de la forma
# # { pinta: 'corazones', palo: 'A' }
# # { pinta: 'corazones', palo: '2' }
# # ...
# # { pinta: 'corazones', palo: 'K' }
# # ...
# # implemente el modulo enumerable sobre este arreglo
# # cree un metodo de clase para buscar por pinta Y palo dentro de este arreglo
# class Mazo
#   extend Enumerable
#   @@cartas = []
#   def self.fill
#     @@cartas << { pinta: 'corazones', palo: 'A' }
#     @@cartas << { pinta: 'corazones', palo: '2' }
#     @@cartas << { pinta: 'corazones', palo: 'K' }
#   end

#   def self.each &block
#     @@cartas.each &block
#   end

#   def self.find_by_pinta_palo pinta, palo
#     find { |carta| carta[:pinta] == pinta && carta[:palo] == palo }
#   end
# end
# Mazo.fill
# Mazo.find_by_pinta_palo 'corazones', 'K'
# # cree un modulo CSV con un metodo de clase to_array que dado un texto en formato
# # csv con las siguientes columnas me devuelva un arreglo de hashes
# # order_id,invoice_id,customer
# # 1,in_4j34h,sescob@ex.com
# # 2,in_14r32,yolo@ex.com
# # 3,in_08c13,yapo@ex.com

# # cree una gema CompanyX con la siguiente estructura de directorios, dentro del
# # directorio models va a tener Company, Person, Employee, Customer
# # lib/
# # lib/companie_x/
# # lib/companie_x/models/
# # lib/companie_x/reporter/
# # lib/companie_x/reporter/sales
# # en reporter/sales cree una classe ConsoleReporter, el cual tendra un metodo de instancia
# # que dado un arreglo de customers imprimira su informacion en la consola
# # TAREA: implemente un CSVReporter que dado un arreglo de customers genera un
# # archivo CSV con la informacion de los customers


# coja 2 numeros del input del usuario, dividalos
# y capture el ZeroDivisionError si ocurre y muestre
# un mensaje de error, haga esto hasta que el usuario copie exit

def get_text
  print '$ '
  text = gets.chomp
end

loop do
  begin
    text = get_text
    break if text == 'exit'
    numero1 = text.to_i

    text = get_text
    break if text == 'exit'
    numero2 = text.to_i

    puts("> #{numero1 / numero2}")
  rescue ZeroDivisionError => e
    puts "Error dividiendo por 0"
  end
end

# vamos hacer un command line application que va a pedir
# el nombre del usuario, si es vacio debe lanzar EmptyNameError,
# tambien pedira la edad del usuario y si es menor que 18 debe
# lanzar Under18Error o un ArgumentError si no es un numero

class EmptyNameError < StandardError
end
class Under18Error < StandardError
end
def get_info
  nombre = get_text 'nombre'
  raise EmptyNameError.new('nombre no puede estar vacio') if nombre.strip.empty?
  edad = Integer(get_text 'edad')
  raise Under18Error.new('edad no puede ser menor de 18') if edad < 18
  puts "success"
end

# dado el siguiente modulo devuelva la constante A dentro del
# metodo de instancia push en la clase ScopeIn
module Dojo
  A = 4
  module Kata
    A = 7
    module Roulette
      class ScopeIn
        include Dojo
        def push
          Kata::A
        end
      end
    end
  end

  def save

  end
end

class Hola
  include Dojo
end



# dado una clase Mazo con un arreglo estatico de cartas de la forma
# { pinta: 'corazones', palo: 'A' }
# { pinta: 'corazones', palo: '2' }
# ...
# { pinta: 'corazones', palo: 'K' }
# ...
# implemente el modulo enumerable sobre este arreglo
# cree un metodo de clase para buscar por pinta Y palo
# dentro de este arreglo

class Mazo
  extend Enumerable
  @@cartas = []
  def self.fill
    @@cartas << { pinta: 'corazones', palo: 'A' }
    @@cartas << { pinta: 'corazones', palo: '2' }
    @@cartas << { pinta: 'corazones', palo: 'K' }
  end

  def self.each &block
    @@cartas.each &block
  end

  def self.find_by_pinta_palo pinta, palo
    find { |carta| carta[:pinta] == pinta && carta[:palo] == palo }
  end
end
Mazo.fill
Mazo.find_by_pinta_palo 'corazones', 'K'

Mazo.each do |carta|
  puts carta
end


# cree una gema CompanyX con la siguiente estructura de directorios,
# dentro del directorio models va a tener Company, Person, Employee,
# Customer
# lib/
# lib/companie_x/
# lib/companie_x/models/
# lib/companie_x/reporter/
# lib/companie_x/reporter/sales
# en reporter/sales cree una classe ConsoleReporter, el cual tendra
# un metodo de instancia que dado un arreglo de customers imprimira
# su informacion en la consola TAREA: implemente un CSVReporter
# que dado un arreglo de customers genera un archivo CSV con la
# informacion de los customers


