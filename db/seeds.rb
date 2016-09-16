san_diego = Location.create(city: "San Diego", state: "CA")
chicago = Location.create(city: "Chicago", state: "IL")

clara = User.create(username: "clarabova", email: "cb@gmail.com", password: "password", user_type: "basic", location: san_diego)

group1 = Group.create(name: "Test Group", description: "Created to test application", location: san_diego)
group2 = Group.create(name: "Test Group2", description: "Created to test application", location: san_diego)
group3 = Group.create(name: "Test Group3", description: "Created to test application", location: san_diego)
group4 = Group.create(name: "Test Group4", description: "Created to test application", location: chicago)
