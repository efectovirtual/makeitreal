// implementar la siguiente herarquia de objetos
//   Person
//      - name
//      - lastName
//      User
//        - username
//        - password
//        Customer
//          - contracts
//        Employee
//          - salary
//         Manager
//          - subordinates
// Person
// User < Person
// Customer < User
// Employee < User
// Manager < Employee

function Person (attrs) {
  this.name = attrs.name
}
function User (attrs) {
  this.username = attrs.username
  Person.call(this, attrs)
}
User.prototype = Object.create(Person.prototype)
User.prototype.constructor = User
function Employee (attrs) {
  this.salary = attrs.salary
  User.call(this, attrs)
}
Employee.prototype = Object.create(User.prototype)
Employee.prototype.constructor = Employee
function Manager (attrs) {
  Employee.call(this, attrs)
}
Manager.prototype = Object.create(Employee.prototype)
Manager.prototype.constructor = Manager
var man = new Manager({
  salary: 10000000,
  username: 'jefesito',
  name: 'The Boss'
})

// ====================================================================

function sayHi () {
  return 'Hi ' + this.name
}

function sayBye () {
  return 'Bye ' + this.name
}

function sayHiAndBye (fun1, fun2, var1) {
  return fun1.call(var1) + ' ' + fun2.call(var1)
}
sayHiAndBye(sayHi, sayBye, { name: 'simon' })
// ====================================================================

function myForEach (array, func) {
  for (var i = 0; i < array.length; i++) {
    func(array[i], i)
  }
}

myForEach([1,2,3,4,5], function (elem, index) {
console.log('Array[%s] = %s', index, elem)
})

function myMap (array, func) {
  var tmp = []
  myForEach(array, function (elem) {
    tmp.push(func(elem))
  })
  return tmp
}

myMap([1,2,3,4,5], function (elem) {
  return Math.pow(elem, 2)
})

// implementar una funcion que dado un arreglo y
// una funcion me sume todos los valores para los
// que la funcion me devuelva true

function sumByFilter (array, func) {
  var sum = 0
  array.forEach(function (elem) {
    if (func(elem)) {
      sum += elem
    }
  })
  return sum
}

function myFilter (array, func) {
  var tmp = []
  array.forEach(function (elem) {
    if (func(elem)) {
      tmp.push(elem)
    }
  })
  return tmp
}


