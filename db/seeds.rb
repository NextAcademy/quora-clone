50.times do |
	user['fullname'] = Faker::Pokemon.name
	user['email'] = Faker::Internet.email
	User.create(user)
	
end

#all valid user id
#uids = User.all.pluck(:id)