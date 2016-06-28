class Balance

	def initialize
		@balance = 0
	end

	def now
		@balance
	end

	def update(amount)
		@balance += amount
	end

end