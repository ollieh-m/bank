class Log

	def initialize
		@log = []
	end

	def store(transaction,balance)
		if transaction.amount > 0
			@log.push({date: transaction.date, credit: transaction.amount, debit: 0, balance: balance})
		else
			@log.push({date: transaction.date, credit: 0, debit: transaction.amount * -1, balance: balance})
		end
	end

	def show
		@log
	end

end