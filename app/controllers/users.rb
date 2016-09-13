#new
get '/register' do
  @user = User.new
  erb :'/users/new'
end

#create
post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id]
    redirect :"/profile/#{@user.username}"
  else
    status 422
    erb :'/users/new'
  end
end

#show
get '/profile/:username' do
  @user = User.find_by(username: params[:username])
  erb :'/users/show'
end
