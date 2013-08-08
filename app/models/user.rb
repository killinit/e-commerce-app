class User
  include MongoMapper::Document
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  key :name_first, String
  key :name_last, String
  key :phone, String
  key :email, String
  key :hash, String
 	key :salt, String
 	key :code, String
 	key :expires_at, Time
 	many :orders
  # one :credential

  def self.authenticate(email, password)
  	user = find_by_email(email)
  	if user && user.hash == BCrypt::Engine.hash_secret(password, user.salt)
  		user
  	else
  		nil
  	end
	end
 	def encrypt_password
 		unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.hash = BCrypt::Engine.hash_secret(password, self.salt)
    end
 	end
end
