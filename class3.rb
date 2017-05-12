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
