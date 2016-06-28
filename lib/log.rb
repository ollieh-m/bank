class Log

	def initialize
		@log = []
	end

	def store(date,type,amount,balance)
		@log.push({date: date, credit: false, debit: false, amount: amount, balance: balance})
		type == :credit ? @log.last[:credit] = true : @log.last[:debit] = true
	end

	def show
		@log
	end

end