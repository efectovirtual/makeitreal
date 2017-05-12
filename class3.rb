# persona = {
#   'name' => 'simon',
#   'edad' => 25,
#   'peso' => nil,
#   'deportes' => ['futbol', 'volleyball', 'tennis'],
#   10 => 'awesome',
#   { 'key' => 'value'} => {},
#   'resultados' => {
#     'universidad' => [
#       { 'periodo' => 'semestre1', 'nota_final': 3.5 },
#       { 'periodo' => 'semestre2', 'nota_final': 3.5 },
#       { 'periodo' => 'semestre3', 'nota_final': 3.5 },
#       { 'periodo' => 'semestre4', 'nota_final': 3.5 }
#     ],
#     'colegio' => [
#       { 'periodo' => 'periodo1', 'nota_final': 3.5 },
#       { 'periodo' => 'periodo2', 'nota_final': 3.5 },
#       { 'periodo' => 'periodo3', 'nota_final': 3.5 },
#       { 'periodo' => 'periodo4', 'nota_final': 3.5 }
#     ]
#   }
# }

# # acceder
# persona['name']
# persona['notas']
# # agregar
# persona[[1,2,3,4]] = 'Error?'
# persona[(1 .. 10)] = 'run rango?'
# # actualizar
# persona['name'] = 'my new name'
# # eliminar
# persona.delete 'name'
# persona.delete 'no existe'
# # recorrido
# persona.each do |key, value|

# end

# # ejercicio, dado el siguiente hash imprimir Nombre y Abreviado
# states = {
#   'Oregon' => 'OR',
#   'Florida' => 'FL',
#   'California' => 'CA',
#   'New York' => 'NY',
#   'Michigan' => 'MI'
# }

# # ejercicio dado el hash anterior encontrar a que ciudad pertenece
# cities = {
#   'CA' => 'San Francisco',
#   'MI' => 'Detroit',
#   'FL' => 'Jacksonville'
# }

# states.each do |state, abbrv|
#   city = cities[abbrv]
#   puts "City(#{city}) State(#{state}) Abbreviation(#{abbrv})"
# end

# states.each do |state, abbrv|
#   city = cities.fetch abbrv, 'Unknown'
#   puts "City(#{city}) State(#{state}) Abbreviation(#{abbrv})"
# end

# # ejercicio dado un hash de una tarjeta de credito imprimir un error si el numbero no esta definido o esta vacio
# cc = { numero: '', vence: '', cuenta_bancaria: '' }
# if !cc[:numero] || cc[:numero].empty?
#   puts 'error'
# end

# numero = cc.fetch :numero
# if numero.empty?
#   puts 'error'
# end

# # ejercicio volver una libreta de direcciones de la siguiente forma en una libreta de direcciones con la forma
# # [ {name: '', address: '', number: ''}]
# libreta = [
#   ["simon@email.com", "123 Main st.", "555-123-4567"],
#   ["santiago@email.com", "404 Not Found Dr.", "123-234-3454"]
# ]

# contactos = libreta.map do |contact|
#   {name: contact[0], address: contact[1], number: contact[2]}
# end


# # ejercicio juntar 2 hashes
# informacion_personal = { nombre: '', telefono: '', direccion: ''}
# informacion_bancaria = { credit_card: '', vence: '', cuenta_bancaria: ''}
# persona = informacion_personal.merge informacion_bancaria



# # Strings


# # EJERCICIO FINAL
# # ejercicio dado el siguiente multistring en formato CSV devolver un arreglo donde
# # cada elemento contenga un hash con los primeros elementos (name, apellido ...) como keys
# # y el resto de los elementos como values e.g
# # [
# #   {
# #       "name" => "simon",
# #   "apellido" => "escobar",
# #       "edad" => "25",
# #         "cc" => "12345"
# #   },
# #   {
# #       "name" => "santigo",
# #   "apellido" => "escobar",
# #       "edad" => "22",
# #         "cc" => "12345"
# #   },
# #   {
# #       "name" => "maria",
# #   "apellido" => "de los angeles",
# #       "edad" => "40",
# #         "cc" => "12345"
# #   }
# # ]
# csv = <<-BEGIN
# name,apellido,edad,cc
# simon,escobar,25,12345
# santigo,escobar,22,12345
# maria,de los angeles,40,12345
# BEGIN
# lines = csv.split("\n")
# headers = lines.shift.split(',')
# name = headers[0]
# apellido = headers[1]
# edad = headers[2]
# cc = headers[3]
# body = lines.collect { |line| line.split(',') }
#   .map do |line|
#     {
#       name => line[0],
#       apellido => line[1],
#       edad => line[2],
#       cc => line[3]
#     }
#   end
[1,2,3,4,5]
:name
persona = {
  # 'name' => 'simon',
  :name => 'simon',
  1 => 'hola',
  [1,2,3,4,5] => 'equipo',
}

clase = {}
clase[:makeitreal] = ['Simon', 'Chris']

clase = [
  { 'nombre' => 'Simon', 'apellido' => 'XXX', 'direccion' => 'dfas'},
  { 'nombre' => 'Santiago', 'apellido' => 'YYY', 'direccion' => 'fdsfs'},
  { 'nombre' => 'Luz', 'apellido' => 'ZZZ', 'direccion' => 'dfgh'},
  { 'nombre' => '', 'direccion' => ''}
]

states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI'
}

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

state = states['Florida']
cities[state]

libreta = [
  ["simon@email.com", "123 Main st.", "555-123-4567"],
  ["santiago@email.com", "404 Not Found Dr.", "123-234-3454"]
]

libreta_contactos = []
libreta.each do |contacto|
  email = contacto[0]
  direccion = contacto[1]
  numero = contacto[2]
  libreta_contactos << {
    'email' => email,
    'direccion' => direccion,
    'numero' => numero
  }
end


str1 = <<-AQUI
  esto
  es un string
  de
  varias lineas
AQUI

csv = <<-BEGIN
name,apellido,edad,cc
simon,escobar,25,12345
santigo,escobar,22,12345
maria,de los angeles,40,12345
BEGIN

per_lines = csv.split("\n")
arr = []
per_lines.each do |line|
  arr.concat line.split(',')
end
