class Purchase
  include Mongoid::Document
  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year, :instructor

  def save
    coach = Instructor.find(instructor)
    user = User.find_by(email: email)
    user.name_first = name_first
    user.name_last = name_last
    user.phone = phone
    order = Order.new(price: price,
                      quantity: quantity,
                      customer_id: user.id,
                      instructor_id: coach.id)
    quantity.to_i.times do 
      lesson = Lesson.new(status: "Active", order_id: order.id)
      lesson.save
    end

    user.save
    order.save
  end
end