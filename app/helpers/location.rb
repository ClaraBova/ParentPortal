helpers do
	def current_location
		@current_location ||= Location.find_by(id: session[:location_id])
	end
end