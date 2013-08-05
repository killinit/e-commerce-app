class Order
  include MongoMapper::EmbeddedDocument

  key :price, Integer
  key :quantity, Integer
end
