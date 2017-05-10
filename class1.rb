puts 1, 'hola clase', 1.0
puts 1
puts 'hola clase'
puts 1.0 # este metodo imprime 1.0 en la consola

puts 'ingresa porfavor tu edad:'
edad = gets.chomp.to_i
puts 'ingresa porfavor tu genero:'
genero = gets.chomp

puts 'tu edad es: ', edad

numero1 = 45
numero2 = 50
numero3 = 100

resultado = numero1 + numero2 + numero3
puts "tu resultado: #{resultado}"


if edad < 18
  puts "eres menor de edad, no pueded tener cerveza"

elsif genero == 'mujer' && edad == 15
  puts "quinceañera"
else
  puts "si puedes tomar cerveza"
end

genero = gets.chomp
puts 'Error: gender not found' if genero != 'hombre' || genero != 'mujer'

j1 = gets.chomp.to_i
j2 = gets.chomp.to_i

# puts "Error invalid input" if j1 < 0 || j1 > 21
is_in_range = j1 >= 0 && j1 <= 21
puts "Error invalid input" unless is_in_range
is_in_range = j2 >= 0 && j2 <= 21
puts "Error invalid input" if !is_in_range

