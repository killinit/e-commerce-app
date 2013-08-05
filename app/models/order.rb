class Order
  include MongoMapper::EmbeddedDocument
  many :lessons

  key :price, Integer
  key :quantity, Integer
end
