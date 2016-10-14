#index
get '/groups' do

end

#new
get '/groups/new' do
  @locations = Location.all.order(:city, :state)
  if logged_in?
    @group = Group.new
    erb :'/groups/new'
  else
    status 401
    @errors = ["Please log in to create a group"]
    erb :'/sessions/new'
  end
end

#create
post '/groups' do
  @locations = Location.all
  group_params = params[:group]
  if group_params[:location] == ""
    status 422
    @errors = ["Please select your location from the drop down list."]
    erb :'/groups/new'
  else
    city = group_params[:location].split(",")[0]
    state = group_params[:location].split(",")[1].strip
    group_location = Location.find_by_city_and_state(city, state)
  end

  @group = Group.new(name: group_params[:name], description: group_params[:description], location: group_location)

  if @group.save
    redirect "/groups/#{@group.id}"
  else
    status 422
    @errors = @group.errors.full_messages
    erb :'/groups/new'
  end
end

# #show
get '/groups/:id' do
  @group = Group.find(params[:id])
  erb :'/groups/show'
end


