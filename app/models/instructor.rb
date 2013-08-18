class Instructor < User
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password
	belongs_to :order

	field :hourly_rate, type: Integer
	field :years_of_experience, type: Integer
end