class Credential
  include MongoMapper::Document
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  key :email, String
  key :mash, String
 	key :salt, String
 	key :code, String
 	key :expires_at, Time
 	belongs_to :user

 	private
 	def encrypt_password
 		puts "encrypt_password"
 		unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.mash = BCrypt::Engine.hash_secret(password, self.salt)
    end
 	end
end
