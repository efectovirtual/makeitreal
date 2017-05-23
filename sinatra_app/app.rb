require 'sinatra'

get '/' do
  puts "PARAMS = #{params}"
  @name = params[:nombre]
  # @producto = 'Hola Variable de instancia'
  erb :index
end

get '/holamundo' do
  puts params
  'hola mundo'
end

post '/orders' do
end

get '/orders' do
  @orders = [
    { order_id: 'o_aerf25', price: 5000 },
    { order_id: 'o_43fqqr', price: 5000 },
    { order_id: 'o_Accaq2', price: 5000 },
    { order_id: 'o_0cawqq', price: 5000 }
  ]
  @order = @orders.find { |order|
    order[:order_id] == params[:order_id]
  }
  erb :orders
end

get '/orders/:order_id' do
  puts "ORDER ID=#{params[:order_id]}"
  puts "SORT BY=#{params[:sort]}"
end

get '/customers/:email/orders' do
  puts "ORDER ID=#{params[:email]}"
end
