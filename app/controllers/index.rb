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