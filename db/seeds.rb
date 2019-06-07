# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	password = "123"

puts "creating users"
10.times do |i|
	email = "user#{i}@test.com"
	first_name = "User#{i}"
	last_name = "Test"
	user = User.new
	user.email = email
	user.password = password
	user.first_name = first_name
	user.last_name = last_name
	user.govid.attach(io: File.open("#{Rails.root}/public/teste.png"), filename: 'teste.png', content_type: 'image/png')
	user.save
end

	body = "In hac habitasse platea dictumst. Ut nec commodo purus. Nullam luctus augue sapien, et ultricies elit volutpat in. Donec imperdiet quis nulla ut varius. Ut tellus enim, accumsan ut enim vitae, luctus interdum nulla. Fusce vitae libero quis dui sollicitudin lobortis tincidunt non nulla. Ut a sem est."	
	a = 39.12
 	b = 39.14
	c = -9.35
 	d = -9.38
puts "creating requests"
10.times do |i|
	title = "#{i} help request"
 	user_id = rand(1..10)
 	type = rand(0..1)
 	if type == 0
 		req_type = "Task"
 	else 
 		req_type = "Materials"
 	end
 	lat = rand(a..b)
 	lng = rand(d..c)

 	req = Request.create!(user_id: user_id, title: title, body: body, req_type: req_type, lat: lat, lng: lng)
 	puts req
end

