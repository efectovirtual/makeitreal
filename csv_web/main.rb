lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'sinatra'
require 'sinatra/reloader' if development?
require 'company'

users = [
  Company::Models::User.new({email: 's@ex.com', full_name: 'Simon E', role: 'admin'}),
  Company::Models::User.new({email: 'a@ex.com', full_name: 'Alex E', role: 'eng'}),
  Company::Models::User.new({email: 'k@ex.com', full_name: 'Kiro E', role: 'user'})
]

get '/generate_report' do
  file = Company::Reporters::Users::Csv.generate users
  content_type 'application/csv'
  attachment 'users_report.csv'
  file
end

get '/create_report' do
  file = Company::Reporters::Users::Csv.create users
  send_file file.path, disposition: :attachment, type: 'application/csv'
end

get '/upload_file' do
  erb :upload_file
end

# post '/upload_file' do
#   puts "FILE = #{params[:file]}"
# end

post '/upload_file' do
  tempfile = params[:file][:tempfile]
  filename = params[:file][:filename]
  uploads_path = File.join __dir__, 'uploads', filename
  File.open uploads_path, 'wb' do |file|
    file.write tempfile.read
  end
end
