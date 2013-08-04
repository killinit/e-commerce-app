class Purchase
  include MongoMapper::Document

  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year

  def save
  	puts "save method"
  	user = User.create!(name_first: name_first, name_last: name_last,
  											phone: phone)
  	# user.orders.create!(price: price, quantity: quantity)
  end
end