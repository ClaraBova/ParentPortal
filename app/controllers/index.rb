get '/' do
  @locations = Location.all
  erb :index
end

