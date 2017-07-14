require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
# require 'sinatra/cookies'

enable :sessions

# methods

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

get '/login' do
  erb :login
end

post '/login' do
  email = params.fetch('email', '').strip
  password = params.fetch('password', '').strip
  if email.empty? || password.empty?
    @errors = [{ message: "Email and Password can't be empty" }]
    halt 400, erb(:login)
    # return error 400, erb(:login)
  end

  unless email == 'simon@ex.com' && password == '1234567890'
    @errors = [{ message: 'email and password does not match' }]
    halt 401, erb(:login)
    # return error 401, erb(:login)
  end

  redirect '/customer'
end

put '/' do
end

patch '/' do
end

delete '/' do
end

options '/' do
end

get '/customer' do
  orders = [
    {order_id: '23dd35', total: 145_000, currency: 'pesos'},
    {order_id: '3r3h57', total: 200_000, currency: 'pesos'},
    {order_id: '65g5q2', total: 100_000, currency: 'pesos'}
  ]
  @customer = { email: 'simon@ex.com', orders: orders }
  erb :customer_account
end

get '/products' do
  # json products
  search_by_price = params.fetch(:by_price, '').strip
  @products = if search_by_price.empty?
    products
  else
    safe_price = search_by_price.to_i
    products.select { |product| product[:price] <= safe_price }
  end

  sort_by = params['sort_by']
  if sort_by
    @products = @products.sort do |product1, product2|
      product1[sort_by.to_sym] <=> product2[sort_by.to_sym]
    end
  end

  erb :'products/index'
end

get '/products/new' do
  erb :'products/new'
end

get '/products/:name' do
  name = params[:name]
  @product = products.find { |product| product[:name] == name }
  halt 404, 'Product not found' unless @product
  erb :'products/product'
end


post '/products' do
  begin
    product = params.fetch :product
    product[:price] = product[:price].to_i
  rescue KeyError
    halt 400, erb(:'products/new')
  end
  products << product
  redirect '/products'
end

delete '/products/:name' do
  index = products.find_index { |product| params[:name] == product[:name] }
  halt 404, 'Product not found' unless index
  products.delete_at index
  redirect '/products'
end

post '/cart' do
  cart = session[:cart]
  if cart
    cart.push params[:product]
    session[:cart] = cart
  else
    # initialize
    cart = [params[:product]]
    session[:cart] = cart
  end
  redirect '/products'
end

get '/visited' do
  visited = request.cookies.fetch('visited', 0).to_i
  response.set_cookie 'visited', visited + 1
  erb :visited
end

not_found do
  status 404
  erb :page404
end
