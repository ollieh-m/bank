class Log

	def initialize
		@log = []
	end

	def store(date,amount,balance)
		if amount > 0
			@log.push({date: date, credit: amount, debit: 0, balance: balance})
		elsif amount < 0
			@log.push({date: date, credit: 0, debit: amount * -1, balance: balance})
		end
	end

	def show
		@log
	end

end