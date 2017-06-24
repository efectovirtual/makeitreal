function reverse () {
  // String(num).split('').reverse().join('')
  return this.split('').reverse().join('')
}

// que me imprime esta funcion?
function test () {
  console.log(a);
  console.log(foo());

  var a = 1;
  function foo() {
    return 2;
  }
}

function test () {
   var a;
   function foo() {
      return 2;
   }

   console.log(a);
   console.log(foo());

   a = 1;
}

function eachWordToUppercase (str) {
  str.split(' ').map(function (word) {
    var char = word.chartAt(0).toUpperCase()
    return char + word.slice(1)
  }).join(' ')
}


function hola1 () {
  [1,2,3,4,5].forEach(function (el) {
    if (el === 1) {
      return
    }
    console.log(el)
  })
}



var library = [
  {
      title: 'Bill Gates',
      author: 'The Road Ahead',
      wasRead: true
  },
  {
      title: 'Steve Jobs',
      author: 'Walter Isaacson',
      wasRead: true
  },
  {
      title: 'Mockingjay: The Final Book of The Hunger Games',
      author: 'Suzanne Collins',
      wasRead: false
  }
];

function unReadBooks (library) {
  return library.filter(function (book) {
    if (!book.wasRead) {
      console.log("el libro %s de %s no hay sido leido ", book.title, book.author)
      return book
    }
  })
}

function clear (arr) {
  arr.forEach(function () {
    arr.pop()
  })
}

function clear (arr) {
  while (arr.length > 0) {
    arr.pop()
  }
}

for (var x = 0; x < arr.length; x++) {
  console.log('ELEM = ', arr[x])
}


var book = {
  title: 'Bill Gates',
  author: 'The Road Ahead',
  wasRead: true
}

var student =  {
  name: "David Rayy",
  sclass: "VI",
  rollno: 12,
  birthdate: new Date()
}

var rgw = {
  red: "#FF0000",
  green: "#00FF00",
  white: "#FFFFFF"
}

// obj[red] = #FF0000
// obj[green] = #00FF00
// obj[white] = #FFFFFF

function values(obj) {
  Object.keys(obj).forEach(function (key) {
    console.log('obj[%s] = %s', key, obj[key])
  })
}

for (var book of library) {
  console.log(book)
}

var library = [
{
   title:  'The Road Ahead',
   author: 'Bill Gates',
   libraryID: 1254
},
{
   title: 'Walter Isaacson',
   author: 'Steve Jobs',
   libraryID: 4264
},
{
   title: 'Mockingjay: The Final Book of The Hunger Games',
   author: 'Suzanne Collins',
   libraryID: 3245
},
{
   title: 'Mockingjay: The Final Book of The Hunger Games',
   author: 'Suzanne Collins',
   libraryID: 2340
}];


[1,6,3,-1,5,-2].sort()

library.sort(function (book1, book2) {
  return (book1.libraryID - book2.libraryID)
})

function User (name, email) {
  this.name = name
  this.email = email
  this.getName = function () {
    return this.name
  }
}

User.prototype.getEmail = function () {
  return this.email
}

var comment = {
  title: '',
  content: '',
  titleCapitalized: function () {
    return this.title.toUpperCase()
  }
}

// ========================
var fullname = 'John Doe';
var obj = {
   fullname: 'Colin Ihrig',
   prop: {
      fullname: 'Aurelio De Rosa',
      getFullname: function() {
         return this.fullname;
      }
   }
};

console.log(obj.prop.getFullname());


// Blog structure as JS Objects
//   Comments
//   Posts
//   Authors
function PostNotFoundError (message) {
  this.message = message
  Error.captureStackTrace(this, this.constructor)
}
PostNotFoundError.prototype = Object.create(Error.prototype)
PostNotFoundError.prototype.constructor = PostNotFoundError

function Author(email) {
  this.email = email
  this.posts = []
}

Author.prototype.createPost = function (post) {
  post.setAuthor(this)
  this.posts.push(post)
}

Author.prototype.getPosts = function () { return this.posts }

Author.prototype.findPostsByTitle = function (title) {
  var found = this.posts.find(function (post) {
    return post.title === title
  })

  if (!found) {
    throw new PostNotFoundError('Post Not Found')
  }
  return found
}

function Post (attrs) {
  this.title = attrs.title
  this.content = attrs.content
  this.author = attrs.author
  this.comments = []
}

Post.prototype.setAuthor = function (author) {
  this.author = author
}

Post.prototype.addComment = function (comment) {
  this.comments.push(comment)
}

Post.prototype.getComments = function (comment) {
  return this.comments
}

function Comment (content) {
  this.content = content
}

var p1 = new Post({
  title: 'The lord of the ring',
  content: 'tl;dr'
})
var p2 = new Post({
  title: 'Harry Potter',
  content: 'tl;dr'
})

var author = new Author('lorenzo@ex.com')
author.createPost(p1)
author.createPost(p2)

var comment1 = new Comment('1234567890')
var comment2 = new Comment('qwertyuiop')

p1.addComment(comment1)
p2.addComment(comment2)

try {
  author.findPostsByTitle('The lord of')
} catch (error) {
  if (error instanceof PostNotFoundError) {
    console.log('MESSAGE: ', error.message)
    console.log('STACK: ', error.stack)
  } else {
    throw error
  }
}
