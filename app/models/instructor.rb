class Instructor < User
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password
end