require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions
get '/' do
  erb :index
end

post '/login' do
  email = params.fetch('email', '').strip
  password = params.fetch('password', '').strip
  if email.empty? || password.empty?
    @errors = [{ message: "Email and Password can't be empty" }]
    return error 400, erb(:index)
  end
  unless email == 'simon@ex.com' && password == '1234567890'
    @errors = [{ message: 'email and password does not match' }]
    return error 401, erb(:index)
  end
  session[:current_customer] = { email: 'simon@ex.com' }
  redirect '/files'
end

get '/files' do
  puts "SESSION #{session[:current_customer]}"
  unless session[:current_customer]
    return redirect '/'
  end
  entries = Dir.entries '.'
  @directories = entries.select { |entry| File.directory? entry }
  @files = entries.select { |entry| File.file? entry }
  erb :files
end

get '/files/:name' do
  # File.read params[:name]
  send_file params[:name], disposition: :inline
end

get '/download/:name' do
  # File.read params[:name]
  send_file params[:name], disposition: :attachment
end
