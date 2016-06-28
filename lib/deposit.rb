require 'date'

class Deposit
	
	attr_reader :date, :amount

	def initialize(amount:)
		@date = Date.today
		@amount = amount
	end

end