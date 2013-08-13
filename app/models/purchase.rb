class Purchase
  include Mongoid::Document
  attr_accessor :package, :price, :quantity, :name_first, :name_last, :phone, 					 :email, :number, :cvc, :exp_month, :exp_year

  def save
    user = User.find_by(email: email)
    user.name_first = name_first
    user.name_last = name_last
    user.phone = phone
    order = Order.new(price: price,
                      quantity: quantity,
                      user_id: user.id)
    quantity.to_i.times do 
      lesson = Lesson.new(status: "Active", order_id: order.id)
      lesson.save
    end

    user.save!
    order.save
  end
end