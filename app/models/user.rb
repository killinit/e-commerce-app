class User
  include MongoMapper::Document

  key :name_first, String
  key :name_last, String
  key :phone, String
end
