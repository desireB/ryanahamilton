# application.rb
require 'sinatra'
require 'sass' # CSS Preprocessing
require 'pony' # Email Delivery

# Variables
set :app_domain, ENV['APP_DOMAIN'] || 'localhost:4567'

# SendGrid Variables
set :email_to, 'ryanahamilton@gmail.com'
set :email_username, ENV['SENDGRID_USERNAME'] || 'username'
set :email_password, ENV['SENDGRID_PASSWORD'] || 'secret'

# SCSS Stylesheet
get '/stylesheets/main.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :stylesheet, :style => :compressed
end

# Home Page
get '/' do
  erb :index, :layout => :layout
end

# Contact Form Submission
post '/contact' do
  Pony.mail :to => settings.email_to,
            :from => params[:name] + "<" + params[:email] + ">",
            :subject => "Message from #{settings.app_domain}",
            :body => params[:message],
            :via => :smtp,
            :via_options => {
              :address              => 'smtp.sendgrid.net',
              :port                 => '587',
              :enable_starttls_auto => true,
              :user_name            => settings.email_username,
              :password             => settings.email_password,
              :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
              :domain               =>  settings.app_domain # the HELO domain provided by the client to the server
            }
  redirect '/'
end

# Work Modal Views
get '/work/:name' do |n|
  erb :"work/#{n}", :layout => false
end