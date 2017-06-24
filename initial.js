  function User (name, lastName) {
    this.age = '24'
    var celular = '123456'
    this.fullName = function () {
      return name + ' ' +lastName
    }
    this.getAge = function () {
      return this.age
    }
  }
  User.sayHello = function (name) {
    return 'Hay mr ' + name
  }

  simon = new User('simon', 'escobar')
  simon.fullName()
  User.sayHello('simon')

  function sayYes (name) {
    return 'Yes ' + name
  }

  function sum (num1, num2) {
    num1 = num1 || 0
    num2 = num2 || 0
    return num1 + num2
  }

  function concat (arr1, arr2) {

  }

[1,2,3,4,5].forEach(function (value, index) {
  console.log('arr[', index, '] = ', value)
})

[1,2,3,4,5].map(function (value, index) {
  return value ** index
})

[1,2,3,4,5,6].filter(function (value) {
  return value % 2 === 0
})

var myGlobal = 35
function global () {
  var myGlobal = 'hola'
}
