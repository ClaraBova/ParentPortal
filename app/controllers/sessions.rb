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
    redirect :"/profile/#{@user.username}"
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
