class User
  include Mongoid::Document
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true

  field :name_first, type: String
  field :name_last, type: String
  field :phone, type: String
  field :email, type: String
  field :hash, type: String
 	field :salt, type: String
 	field :code, type: String
 	field :expires_at, type: Time
 	has_many :orders
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
