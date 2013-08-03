class Purchase
  include MongoMapper::Document

  attr_accessor :package, :name_first, :name_last, :phone, :email, :number,
  							:cvc, :exp_month, :exp_year

  def save
  	puts "save method"
  end
end
