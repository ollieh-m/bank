class Deposit
	
	attr_reader :date, :amount

	def initialize(amount:)
		@date = DateTime.now
		@amount = amount
	end

end