class Purchase
  include MongoMapper::Document

  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year

  def save
  	puts "save method"
  	#based on quantity, create an array of lessons
  	lessons = []
  	quantity.to_i.times do 
  		lessons.push Lesson.new status: "0"
  	end

  	user = User.new(name_first: name_first, name_last: name_last,
  											phone: phone, 
  											orders: 
  											[
  												price: price, 
  												quantity: quantity,
  												lessons: lessons
  											])
    user.credential = Credential.new()
  	user.save
  end
end