class Credential
  include MongoMapper::Document

  key :email, String
  key :mash, String
 	key :salt, String
 	key :code, String
 	key :expires_at, Time
 	belongs_to :user
end
