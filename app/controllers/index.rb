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
  p params[:human]
  if params[:human].strip.downcase != "blue"
    @notice = "Please prove that you're not a robot."
    erb :rsvp
  elsif !params[:attending]
    @notice = "Please check one of the boxes."
    erb :rsvp
  else

   require 'pony'
   subj = params[:name] + " RSVP'd with a #{params[:attending]}"
   body = "#{params[:name]} said #{params[:attending]} for #{params[:number]} guests.\n\n Comment:\n  " + params[:comment]
   Pony.mail({
    :from => params[:email],
      :to => ['lukert33@gmail.com', 'njsohl@gmail.com'],
      :subject => subj,
      :body => body,
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
end

get '/success' do
  erb :success
end

get '/registery' do 
  erb :registery
end