# application.rb
require 'sinatra'
require 'sass'

# SCSS Stylesheet
get '/stylesheets/main.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :stylesheet, :style => :compressed
end

# Home Page
get '/' do
  erb :index, :layout => :layout
end

# Work Modal
get '/work' do
  erb :work, :layout => false
end