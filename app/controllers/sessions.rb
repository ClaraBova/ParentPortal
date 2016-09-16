#new
get '/login' do
  if request.xhr?
    erb :"/sessions/new", layout: false
  else
    erb :"/sessions/new"
  end
end

#create
post '/login' do
  p user_params = params[:user]
  @user = User.authenticate(user_params[:email], user_params[:password])
  if @user
    session[:username] = @user.username
    redirect :"/"
  else
    status 422
    @errors = ["Login failed"]
    erb :'/sessions/new'
  end
end

#delete
delete '/logout' do
  session.delete(:username)
  redirect :'/'
end

post '/sessions/location' do
  city = params[:location].split(",")[0]
  state = params[:location].split(",")[1].strip
  session[:location_id] = Location.find_by_city_and_state(city, state).id
  if request.xhr?
    @location = Location.find(session[:location_id])
    erb :'/locations/show', layout: false
  else
    redirect :"/locations/#{session[:location_id]}"
  end
end
