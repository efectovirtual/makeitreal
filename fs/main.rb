require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  path = File.expand_path '.'
  entries = Dir.entries path
  @directories = entries.select { |entry| File.directory?(entry) && entry != '.' }
  @files = entries.select { |entry| !File.directory? entry }
  erb :index
end

get '/files/:name' do
  path = params[:name]
  path = File.join File.expand_path '.', path
  send_file path, disposition: :inline
end

get '/download/:name' do
  path = params[:name]
  path = File.join File.expand_path '.', path
  send_file path, disposition: attachment
end
