#new
get '/register' do
  @user = User.new
  if request.xhr?
    erb :'/users/new', layout: false
  else
    erb :'/users/new'
  end
end

#create
post '/register' do
  @locations = Location.all
  user_params = params[:user]
  if user_params[:location] == ""
    status 422
    @errors = ["Please select your location from the drop down list."]
    erb :'/users/new'
  else
    city = user_params[:location].split(",")[0]
    state = user_params[:location].split(",")[1].strip
    user_location = Location.find_by_city_and_state(city, state)
  end

  @user = User.new(username: user_params[:username], email: user_params[:email], password: user_params[:password], user_type: user_params[:user_type], location: user_location)

  if @user.save
    session[:username]
    redirect :"/profile/#{@user.username}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

#show
get '/profile/:username' do
  @user = User.find_by(username: params[:username])
  erb :'/users/show'
end
