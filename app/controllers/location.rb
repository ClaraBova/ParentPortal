#show
get '/locations/:id' do
  @location = Location.find(params[:id])
  erb :'/locations/show'
end
