# def sum num1, num2
#   num1 + num2
# end

# def sumatoria values, inicial = 0
#   sumatoria = inicial
#   values.each do |value|
#     sumatoria += value
#   end
#   sumatoria
# end

# def avg_int values
#   valor = 0
#   values.each do |value|
#     valor += value
#   end
#   valor / values.length
# end

# def avg values
#   valor = 0
#   values.each do |value|
#     valor += value
#   end
#   valor.fdiv values.length
# end

# def avg values
#   sum = values.reduce(:+)
#   sum.fdiv values.length
# end

# def avg values
#   sum = values.inject { |sum, value| sum + value }
#   sum.fdiv values.length
# end

# def sum(num1, num2)
#   num1 + num2
# end

# def fetch hash, key, default
#   value = hash[key]
#   value ? value : default
# end

# hash = {}
# result = fetch(hash, :name, 'hola')

# # ejercicios
# # implementar la funcion take, dado un arreglo y un numero sacar ese numero de
# # elementos sin modificar el arreglo inicial, si el numero no es pasado como argumento
# # debe retornar todo el arreglo
# def take arr, num = arr.length
#   arr[0 ... num]
# end
# # implementar la funcion values de los hashes
# def values hash
#   hash.map { |key,value| value }
# end
# # implementar la funcion has_key?
# def has_key? hash, key
#   !!hash.find { |k, v| k == key }
# end

# # convenciones metodos con ! y metodos con ?
# def concat array1, array2
#   temp = []
#   array1.each do |element|
#     temp << element
#   end

#   array2.each do |element|
#     temp << element
#   end

#   temp
# end

# def concat! array1, array2
#   array2.each do |element|
#     array1 << element
#   end
#   array1
# end


# def grater? num1, num2
#   num1 > num2
# end

# def include? array, value
#   found = array.find { |element| element == value }
#   if found
#     true
#   else
#     false
#   end
# end

# # Archivos
# IO.readlines('./test.rb')
# IO.read('./test.rb')
# IO.read('./test.rb').split("\n")

# # overwrite
# new_file = File.new('auto_generated.rb', 'w')
# new_file.write <<-IRB
#   puts "Hello World"
# IRB
# new_file.close

# # append
# new_file = File.new('auto_generated.rb', 'a')
# new_file.write <<-IRB
#   puts "Just another line"
# IRB
# new_file.close

# File.open('auto_generated.rb', 'a') do |file|
#   file.write <<-IRB
#   puts "Auto closed"
# IRB
# end

# File.exist? 'auto_generated.rb'
# f = File.open 'class2.rb' if File.exists? 'class2.rb'
# f.each_line do |line|
#   puts "LINE => #{line}"
# end
# f.close

# File.rename 'auto_generated.rb', 'renamed_auto_generated.rb'
# File.file? 'renamed_auto_generated.rb'
# File.exist? 'renamed_auto_generated.rb'
# File.directory? '.'
# File.directory? File.expand_path('~/Documents')
# File.extname 'renamed_auto_generated.rb'
# File.direname ''

# # Ejercicio, miren si un archivo existe
# # si el archivo existe impriman todas las lineas en uppercase
# # si no existe creen el archivo con permisos de escritura, escriban un texto largo
# #

def sum(num1, num2)
  if num1 % 2 == 0
    return num1 - num2
  end
  num1 + num2


def say_hi name
  "Hola #{name}"
end

def sumatoria values, inicial=0
  inicial = inicial || 0
  suma = inicial
  values.each do |value|
    suma += value
  end
  suma
end

def fetch hash, key, default
  value = hash[key]
  value ? value : default
end
persona = {  'nombre'=>'simon', 'edad' => 25 }
fetch(persona, 'nombre', 'hola')

def avg values
  valor = 0
  values.each do |value|
    valor += value
  end
  valor.fdiv values.length
end

def avg values
  sum = values.reduce(:+)
  sum.fdiv values.length
end

def avg values
  sum = values.inject { |sum, value| sum + value }
  sum.fdiv values.length
end

value = [1,2,3,4,5,6]
suma = 0
suma = suma + value[0]
suma = suma + value[1]
suma = suma + value[2]

def concat array1, array2

end

def concat array1, array2
  temp = []
  array1.each do |element|
    temp << element
  end

  array2.each do |element|
    temp << element
  end

  temp
end

def concat! array1, array2
  array2.each do |element|
    array1 << element
  end
  array1
end

def grater? num1, num2
  num1 > num2
end

puts "subir un archivo a internet:"
archivo = gets.chomp
