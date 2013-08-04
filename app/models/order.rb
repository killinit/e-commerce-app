class Order
  include MongoMapper::Document

  key :price, Integer
  key :quantity, Integer
end
