class Package
  include MongoMapper::Document

  key :quantity, Integer
  key :price, Integer
end
