Package.destroy_all
Package.create([
	{
		quantity: 1,
		price: 8500
	},
	{
		quantity: 5,
		price: 40000
	},
	{
		quantity: 10,
		price: 75000
	},
	{
		quantity: 20,
		price: 140000
	}
	])

User.destroy_all
user = User.new(email: "superman@gmail.com", 
								password: "123", 
								password_confirmation: "123")

instructor = Instructor.new(email: "donniemac@gmail.com",
														password:"123",
														password_confirmation:"123")

instructor2 = Instructor.new(email: "roger@gmail.com",
														password:"123",
														password_confirmation:"123")

order = Order.new(price: 8500,
									quantity: 1,
									user_id: user.id,
									instructor_id: instructor.id)

order2 = Order.new(price: 40000,
									quantity: 5,
									user_id: user.id,
									instructor_id: instructor2.id)

1.times do 
	lesson = Lesson.new(status: "Available", order_id: order.id)
	lesson.save
end

5.times do
	lesson = Lesson.new(status: "Available", order_id: order2.id)
	lesson.save	
end

user.save
instructor.save
instructor2.save
order.save
order2.save