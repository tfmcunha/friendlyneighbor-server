# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
 	user_id = rand(1..6)
 	title = "#{i} help request"
 	body = "In hac habitasse platea dictumst. Ut nec commodo purus. Nullam luctus augue sapien, et ultricies elit volutpat in. Donec imperdiet quis nulla ut varius. Ut tellus enim, accumsan ut enim vitae, luctus interdum nulla. Fusce vitae libero quis dui sollicitudin lobortis tincidunt non nulla. Ut a sem est. Phasellus eleifend consectetur lorem eu fringilla. Vivamus ultrices scelerisque est eget convallis. Nam fringilla nulla et massa ornare, quis congue ante vehicula."
	req_type = rand(0..1)
 	a = 39.12
 	b = 39.14
	c = -9.35
 	d = -9.38

 	lat = rand(a..b)
 	lng = rand(d..c)

 	Request.create(user_id: user_id, title: title, body: body, req_type: req_type, lat: lat, lng: lng)


end

