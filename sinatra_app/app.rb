require 'sinatra'
require 'sinatra/json'

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
  puts "SEARCH = #{params[:search]}"

  @orders = [
    { order_id: 'o_aerf25', price: 5000 },
    { order_id: 'o_43fqqr', price: 5000 },
    { order_id: 'o_Accaq2', price: 5000 },
    { order_id: 'o_0cawqq', price: 5000 }
  ]
  @order = @orders.find { |order|
    order[:order_id] == params[:search]
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

get '/foo' do
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
    return error(400, erb(:login))
  end
  unless email == 'simon@ex.com' && password == '1234567890'
    @errors = [{ message: 'email and password does not match' }]
    return error 401, erb(:login)
  end
  redirect "/user_account/#{params[:email]}"
end

get '/user_account/:email' do
  @email = params[:email]
  erb :account
end

get '/foo' do
  puts "REQUEST_METHOD => #{request.request_method}"
  puts "BODY => #{request.body}"
  puts "SCHEME => #{request.scheme}"
  puts "SCRIPT_NAME => #{request.script_name}"
  puts "PATH_INFO => #{request.path_info}"
  puts "PATH => #{request.path}"
  puts "PORT => #{request.port}"
  puts "QUERY_STRING => #{request.query_string}"
  puts "CONTENT_LENGTH => #{request.content_length}"
  puts "MEDIA_TYPE => #{request.media_type}"
  puts "HOST => #{request.host}"
  puts "GET? => #{request.get?}"
  puts "FORM_DATA? => #{request.form_data?}"
  puts "USER_AGENT => #{request.user_agent}"
  puts "COOKIES => #{request.cookies}"
  puts "XHR? => #{request.xhr?}"
  puts "URL => #{request.url}"
  puts "PATH => #{request.path}"
  puts "IP => #{request.ip}"
  puts "SECURE? => #{request.secure?}"
  puts "ENV => #{request.env}"
end
