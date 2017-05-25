require 'sinatra'

enable :sessions

products = [
  {name: 'audifonos', price: 150, currency: 'usd'},
  {name: 'book', price: 30, currency: 'usd'},
  {name: 'mouse', price: 20, currency: 'usd'},
  {name: 'mac', price: 2300, currency: 'usd'}
]

get '/' do
  @products = products
  erb :index
end

get '/products/new' do
  erb :products_new
end

post '/products/new' do
  name = params[:product][:name]
  price = params[:product][:price]
  currency = params[:product][:currency]
  puts "PARAMS = #{params}"
  products.push({
    name: name,
    price: price,
    currency: currency
  })
  redirect '/'
end

delete '/products/:name' do
  product = products.find do |product|
    product[:name] == params[:name]
  end

  return redirect '/' unless product

  products.delete product
  redirect '/'
end

get '/visited' do
  @visited = request.cookies.fetch('visited', 0).to_i
  response.set_cookie 'visited', @visited + 1
  erb :visited
end

get '/products/:name' do
  name = params[:name]
  @product = products.find { |product| product[:name] == name }
  halt 404, 'Product not found' unless @product
  erb :product
end

post '/cart' do
  product = params[:product]
  cart = session[:cart]
  puts "CART = #{cart}"
  if cart
    cart << product
  else
    cart = [ product ]
    session[:cart] = cart
  end
  redirect '/'
end
