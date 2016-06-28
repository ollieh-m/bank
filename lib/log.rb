class Log

	def initialize
		@log = []
	end

	def store(date,amount,balance)
		@log.push({date: date, credit: true, debit: false, amount: amount, balance: balance})
	end

	def show
		@log
	end

end