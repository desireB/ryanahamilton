# application.rb
require 'sinatra'
require 'sass' # CSS Preprocessing
require 'pony' # Email Delivery

configure :production do
  require 'newrelic_rpm'
end

# Variables
set :app_domain, ENV['URL'] || 'localhost:4567'

# Contact Variables - SendGrid w/ Gmail Fallback
set :email_to, ENV['EMAIL_TO'] || 'you@domain.com'
set :email_service, ENV['EMAIL_SERVICE'] || 'gmail.com'
set :email_username, ENV['SENDGRID_USERNAME'] || 'username@gmail.com'
set :email_password, ENV['SENDGRID_PASSWORD'] || 'secret'

# Redirect to non-www domain
before do
  redirect request.url.sub(/www\./, ''), 301 if request.host =~ /^www/
end

# SCSS Stylesheet
get '/stylesheets/application.css' do
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
              :address              => 'smtp.' + settings.email_service,
              :port                 => '587',
              :enable_starttls_auto => true,
              :user_name            => settings.email_username,
              :password             => settings.email_password,
              :authentication       => :plain,
              :domain               => settings.app_domain
            }
  redirect '/'
  # TODO: Add flash notice of some sort to confirm message being sent
end

# Work Modal Views
get '/work/:name' do |n|
  erb :"work/#{n}", :layout => false
end