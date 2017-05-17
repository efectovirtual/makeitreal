# Ejercicio crear el modelo de herencia para figuras geometricas Circulo, Recatangulo Triangulo, Cuadrado
# class Shape
#   def primetro
#   end

#   def area
#   end

#   def lados
#   end
# end

# class Triangulo < Shape
#   attr_accessor :base, :lado1, :lado2, :altura

#   def initialize base, lado1, lado2, altura
#     @base = base
#     @lado1 = lado1
#     @lado2 = lado2
#     @altura = altura
#   end

#   def perimetro
#     base + lado1 + lado2
#   end

#   def area
#     (base * altura) / 2.0
#   end

#   def lados
#     3
#   end
# end

# class Circulo < Shape
#   attr_accessor :radio

#   def initialize radio
#     @radio = radio
#   end

#   def perimetro
#     2 * Math::PI * radio
#   end

#   def area
#     (Math::PI * (radio ** 2)) / 2
#   end

#   def lados
#     1
#   end
# end

# class Rectangulo < Shape
#   attr_accessor :lado1, :lado2

#   def initialize lado1, lado2
#     @lado1 = lado1
#     @lado2 = lado2
#   end

#   def perimetro
#     2 * lado1 + 2 * lado2
#   end

#   def area
#     lado1 * lado2
#   end
# end

# class Cuadrado < Rectangulo
# end


# Ejercicio avanzado jerarquia de una compañia (Personas, Jefe, Empleados etc)
# class Compania
#   attr_accessor :empleados, :clientes, :name
#   attr_accessor :empleados, :clientes
#   def initialize name
#     @name = name
#   end
# end

# class Personas
#   attr_accessor :name, :cc, :birthdate
# end

# class Cliente < Persona
#   attr_accessor :credit_card, :cuenta_bancaria, :proyectos
# end

# class Jefe < Persona
#   attr_accessor :porcentaje_empresa
# end

# class Empleado < Persona
#   attr_accessor :horario, :sueldo, :proyectos, :cargo
# end

# class Gerente < Empleado
#   attr_accessor :documentos
# end

# class Desarrollador < Empleado
#   attr_accessor :skills
#   def cargo
#     "Full Stack ninja #{super}"
#   end
# end

# Compania.new
class Figura
  def perimetro
  end

  def lados
  end

  def area
  end
end

class Circulo < Figura
  attr_accessor :radio
  def initialize radio
    @radio = radio
  end

  def perimetro
    Math::PI * 2 * @radio
  end

  def lados
    1
  end

  def area
    Math::PI * (@radio ** 2)
  end
end

class Triangulo < Figura
  def initialize base, lado1, lado2, altura
    @base = base
    @lado1 = lado1
    @lado2 = lado2
    @altura = altura
  end

  def primetro
    @base + @lado1 + @lado2
  end

  def area
    (@base * @altura) / 2.0
  end

  def lados
    3
  end
end

class Rectangulo < Figura
  attr_accessor :lado1, :lado2

  def initialize lado1, lado2
    @lado1 = lado1
    @lado2 = lado2
  end

  def perimetro
    2 * lado1 + 2 * lado2
  end

  def area
    lado1 * lado2
  end
end

class Cuadrado < Rectangulo
end

class CuadradoEspecial < Rectangulo
  def perimetro
    puts 'estas llamando al cuadrado especial'
    super
  end
end

# Ejercicio jerarquia de una compañia
# (Personas, Jefe, Empleados etc)
class Compania
  attr_accessor :clientes
  attr_reader :nombre, :empleados
  # nombre, nit, empleados, direccion, accionistas, jefe
  # clientes, proveedores, proyectos
  def initialize attributes = {}
    @nombre = attributes[:nombre]
    @nit = attributes[:nit]
    @empleados = []
    @clientes = []
  end

  def despedir empleado
    @empleados.delete empleado
  end

  def contratar empleado
    @empleados << empleado
  end
end

class Persona
  # nombre, edad, cc, visa, email, genero, idioma
  def initialize attributes = {}
    @nombre = attributes[:nombre]
    @email = attributes[:email]
    @cc = attributes[:cc]
  end
end

class Empleado < Persona
  # horario, sueldo, cargo, proyectos, skills
  def initialize attributes = {}
    super attributes
    @horario = attributes[:horario]
    @sueldo = attributes[:sueldo]
    @cargo = attributes[:cargo]
    @compania = attributes[:compania]
  end
end

simon =  Empleado.new

class Cliente < Persona
  # credit_card, cuenta_bancaria, proyectos
  def initialize nomnre, edad, ... credit_card
    super nombre, edad, ...
    @credit_card = credit_card
    ...
  end
end
cliente = Cliente.new nombre, edad..., credit_card, cuenta_bancaria

class Gerente < Empleado
  # documentos, areas
end

class Desarrollador  < Empleado
  # lenguajes, logros
  def initialize attributes = {}
    super attributes
    @lenguajes = attributes[:lenguajes]
  end

  def cargo
    "Full Stack ninja #{super}"
  end
end

dev = Desarrollador.new({
  nombre: 'simon',
  email: 'simon@ex.com',
  cc: '1234567890',
  horario: 'lunes a viernes',
  sueldo: 1000,
  cargo: 'profesor',
  lenguajes: 'ruby'
})

Una compañia puede contratar empleados
Una compañia puede despedir empleados
Una compañia puede hacer convenios con clientes










class Universidad
  attr_accessor :estudiantes
  def initialize
    @estudiantes = []
  end
end

class UniversidadEstudiante
  attr_accessor :estudiante_universidad
  def initialize
    @estudiante_universidad = []
  end

  def find_univesidad_by_estudiante estudiante
    @estudiante_universidad.select do |relation|
      relation[:estudiante] == estudiante
    end
  end
end

class Estudiante
  attr_accessor :universidades
  def initialize
    @universidades = []
  end
end

cris = Estudiante.new
nacional = Universidad.new
eafit = Universidad.new
relacion_es_un = UniversidadEstudiante.new
relacion_es_un.estudiante_universidad << { estudiante: cris, universidad: nacional }
relacion_es_un.estudiante_universidad << { estudiante: cris, universidad: eafit }
relacion_es_un.find_univesidad_by_estudiante cris







class Animal
  def speak
    "Hello!"
  end
end

class Cat < Animal
end

gato = Cat.new
gato.speak

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def speak
    "#{super} says arf!"
  end
end

class BigGoodDog < GoodDog
  def speak
    "#{super} Big Good Dog is here"
  end
end
dog = GoodDog.new 'kiro'
dog.speak

class Granja
  attr_accessor :animales
  def initialize
    @animales = []
  end
end







