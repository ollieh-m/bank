require 'date'

class Deposit
	
	attr_reader :date

	def initialize
		@date = Date.today
	end

end