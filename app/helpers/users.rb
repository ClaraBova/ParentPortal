helpers do
  def current_user
    @current_user ||= User.find_by(username: session[:username])
  end

  def logged_in?
    !current_user.nil?
  end

end
