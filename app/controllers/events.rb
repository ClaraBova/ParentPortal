
get '/events/new' do
  if logged_in?
    @event = Event.new
    erb :'/events/new'
  else
    status 401
    @errors = ["Please log in to host an Event"]
    erb :'/sessions/new'
  end
end

post '/events' do
  event_params = params[:event]
  @event = Event.new(event_params)
  if @event.save
    redirect "/events/#{@event.id}"
  else
    status 422
    @errors = @event.errors.full_messages
    erb :'/events/new'
  end
end

#show
get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/show'
end
