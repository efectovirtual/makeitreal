# Iterators
edad = 0
while edad < 18  do
   puts "Edad actual es: #{i}, aun no cumples 18"
   edad +=1
end

loop do
  puts "Esto imprime hasta que hagan Ctrl + c" # o break
end

until i > num
  puts "Inside the loop i = #{i}"
  i +=1;
end

18.times do |num|
  puts "Contador: #{num}"
end

0.upto 100 do |x|
  puts "numero es #{x}"
end

100.downto 0 do |x|
  puts "numero es #{x}"
end

('a' .. 'z').each { |l| puts l }
(10 .. 15) => [10, 11, 12, 13, 14, 15]
(10 ... 15) => [10, 11, 12, 13, 14]

# Arrays
clase = ['Alberto', 'Christopher', 'Cristian', 'Arcangel', 'Mateo', 'Jaime', 'David', 'David', 'Juan', 'Andrés']
# Access
clase[0]
clase[clase.length - 1]
clase[-1]
clase[2 .. 9]
# Operations ADD
# .insert index, value
# .push value
# << value
# Operations DELETE
# .shift
# .pop
# .delete_at
# Iterators
for name in clase
   puts "Hola #{name}"
end
clase.each_with_index do |elem, index|
  puts "clase[#{index}] = #{elem}"
end
clase.each do |nombre|
  puts "el estudiante con nombre #{nombre}"
end
# Arrays and Iterators
# Max - with each and with .max
# Find - with each and with .find
# Select - with each and with .select
# Map - with each and with .map


# Ejercicios
# imprimir los numeros de 1 al 100 con while
# imprimir los numeros de 1 al 100 con upto
# imprimir los numeros del 100 al 1 solo los pares con until
# imprimir los numeros del 100 al 1 solo los pares con downto
# cojer el input del usuario hasta que copie exit o CTRL-C con loop
# imprimir 100 veces un texto a menos que el numero sea multiplo de 3 con times
# imprimir las letras de la a a la z
# imprimir las letras de la a a la z con un rango
# con un rango y un text "Make it real camp" coger el texto "real"

# dado un rango de letras de la a la z convertirlo a un arreglo
# con un arreglo de letras de la a la z, con que indice accedo a la letra s?
# armar la palabra Make it real accediendo al arreglo
# como accedo a la letra z? (ultima letra)
# como accedo a la letra d hasta la letra m? (rango)
# como elimino las primeras 3 letras? (3.times shift)
# como elimino las ultimas 3 letras? (3.times pop)
# como elimino la letra 'x' (delete_at)
# como elimino la letra 'n' (delete 'n')
# crear un arreglo vacio y llenarlo con 5 arreglos de personas y puntajes e.g ['simon', 10] (usar push, <<)
# agregar ['German', 15] al principio de la lista (con insert)
# agregar ['Lucas', 5] en la posicion 3 de la lista (con unshift)
# agregar ['Melanie', 20] al principio de la lista (con unshift)
#

# imprimir todos los elementos de un arreglo con .each
# imprimir todos los nombres del arreglo clase en posicion par
# encontrar la persona que se llama

veces = 5
numerador = 0
while numerador <= veces
  puts "El numerador esta en = #{numerador}"
  numerador += 1 # numerador = numerador + 1
end

veces = 5
numerador = 0
while numerador <= veces
  puts "Entra tu nombre"
  nombre = gets.chomp
  if nombre == 'exit'
    break
  end
  puts "El nombre es #{nombre}"
  numerador += 1 # numerador = numerador + 1
end

5.times { |contador| puts contador }
5.times do
  puts "Entra tu nombre"
  nombre = gets.chomp
  if nombre == 'exit'
    break
  end
  puts "El nombre es #{nombre}"
end

100.times do |contador|
  if contador.even?
    puts contador
  end
end

loop do
  puts "Entra tu nombre"
  nombre = gets.chomp
  if nombre == 'exit'
    break
  end
  puts "El nombre es #{nombre}"
end

veces = 5
num = 0
until num == 5
  puts "num = #{num}"
  num += 1
end

20.upto(60) do |contador|
  puts contador
end

100.downto(0) do |contador|
  puts contador
end

clase = ['simon', 'santiago', 'kiro', 'ruben']
clase[clase.length - 1]
"make it real camp"

clase.each do |miembro|
  puts miembro
end

clase.find do |miembro|
  miembro == 'kiro'
end

alfabeto = ('a' .. 'z').to_a
nombre = alfabeto.find { |miembro| miembro == 'm' }

alfabeto.each_with_index do |letra, indice|
  puts "alfabeto[#{indice}] = #{letra}"
end

juego = []
juego << ['simon', 10]
juego.push ['juan', 15]
juego << ['mateo', 5]
juego << ['pedro', 11]

puntajes = juego.map do |jugador|
  jugador[1]
end

puntajes.max
