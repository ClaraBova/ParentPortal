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
  @user = User.new(params[:user])
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
