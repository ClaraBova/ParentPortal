#new HOST EVENT
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

#create HOST EVENT
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

# #edit
# get '/potlucks/:id/edit' do
#   @potluck = Potluck.find(params[:id])
#   erb :'/potlucks/edit'
# end

# #update
# put '/potlucks/:id' do
#   @potluck = Potluck.find(params[:id])
#   potluck_params = params[:potluck]
#   @potluck.update_attributes(name: potluck_params[:name], time: potluck_params[:time], location: potluck_params[:location])
#   if @potluck.save
#     redirect "/potlucks/#{@potluck.id}"
#   else
#     status 422
#     @errors = @potluck.errors.full_messages
#     erb :'/potlucks/edit'
#   end
# end

# #delete
# delete '/potlucks/:id' do
#   @potluck = Potluck.find(params[:id])
#   @potluck.destroy
#   redirect '/'
# end

# #---------------PotluckAttendees
# #new
# get '/potlucks/:id/attendee/new' do
#   @potluck = Potluck.find(params[:id])
#   @potluckAttendee = PotluckAttendee.new
#   erb :'/potluck_attendees/new'
# end

# #create
# post '/potluck_attendees' do
#   @potluck = Potluck.find(params[:potluck_id])
#   @potluckAttendee = PotluckAttendee.new(params)
#   if @potluckAttendee.save
#     redirect :"/potlucks/#{params[:potluck_id]}"
#   else
#     @errors = @potluckAttendee.errors.full_messages
#     erb :'/potluck_attendees/new'
#   end
# end
