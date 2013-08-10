# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

user = User.new(email: "superman@gmail.com", 
								password: "123", 
								password_confirmation: "123")
order = Order.new(price: 200,
									quantity: 3,
									user_id: user.id)
3.times do 
	lesson = Lesson.new(status: true, order_id: order.id)
	lesson.save
end

user.save
order.save