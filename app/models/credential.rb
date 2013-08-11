class Credential
  include Mongoid::Document
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true

  field :email, type: String
  field :mash, type: String
 	field :salt, type: String
 	field :code, type: String
 	field :expires_at, type: Time
 	belongs_to :user

 def authenticate(email, password)
 		#check whether email and password are valid
 	count = Credential.where(email: email).count
 	if count > 0
 		puts "USER FOUND****************"
 		puts user
 		return user
 	else
 		puts "NOT FOUND***************"
 		return nil
 	end
 end


 	def encrypt_password
 		puts "encrypt_password"
 		unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.mash = BCrypt::Engine.hash_secret(password, self.salt)
    end
 	end
end
