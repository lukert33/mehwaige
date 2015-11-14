get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/accomodations' do 
  erb :accomodations
end

get '/rsvp' do 
  erb :rsvp 
end

post '/rsvp' do
 require 'pony'
 Pony.mail({
  :from => params[:name],
    :to => ['lukert33@gmail.com', 'njsohl@gmail.com'],
    :subject => params[:name] + " RSVP'd for the wedding",
    :body => params[:comment],
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  })
  redirect '/success' 
end

get '/success' do
  erb :success
end

get '/registery' do 
  erb :registery
end