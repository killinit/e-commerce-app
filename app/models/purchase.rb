class Purchase
  include MongoMapper::Document

  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year

  def save
  	puts "save method"
  	user = User.new(name_first: name_first, name_last: name_last,
  											phone: phone, 
  											orders: [price: price, quantity: quantity])
  	user.save
  end
end