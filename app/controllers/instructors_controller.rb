class InstructorsController < ApplicationController
	def show
		if is_instructor?(@customer)
			#console.log('is an instructor')
			@customers = User.all
		end
	end
end