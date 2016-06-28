class Withdrawal

	attr_reader :date, :amount

	def initialize(amount:)
		@date = DateTime.now
		@amount = amount*(-1)
	end

end