class Order
  include MongoMapper::Document
  belongs_to :user
  many :lessons

  key :price, Integer
  key :quantity, Integer
end
