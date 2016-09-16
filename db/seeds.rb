san_diego = Location.create(city: "San Diego", state: "CA")
chicago = Location.create(city: "Chicago", state: "IL")

clara = User.create(username: "clarabova", email: "cb@gmail.com", password: "password", user_type: "basic", location: san_diego)

spParents = Group.create(name: "South Park Parents", description: "Bringing South Park parents together for playdates, events, and sharing info", location: san_diego)
npParents = Group.create(name: "South Park Parents", description: "Bringing North Park parents together for playdates, events, and sharing info", location: san_diego)
evParents = Group.create(name: "East Village Parents", description: "Bringing East Village parents together for playdates, events, and sharing info", location: san_diego)
liParents = Group.create(name: "Little Italy Parents", description: "Bringing Little Italy parents together for playdates, events, and sharing info", location: chicago)

BalboaPark = Event.create(name: "Playdate at Balboa Park", description: "Monthly meetup at Balboa Park", host: clara, time: "2017-05-22 12:00", location_id: 1, location_description: "Balboa Park")
