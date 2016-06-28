class Log

	def initialize
		@log = []
	end

	def store(transaction,balance)
		@log.push({transaction: transaction, balance: balance})
	end

	def show
		@log
	end

end