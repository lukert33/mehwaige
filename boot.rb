require 'sinatra'
require "sinatra/reloader" if development?
require 'thin'


get '/' do
  erb :welcome
end