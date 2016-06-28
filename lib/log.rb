class Log

	def initialize
		@log = []
	end

	def store(date,type,amount,balance)
		if type == :credit
			@log.push({date: date, credit: true, debit: false, amount: amount, balance: balance})
		else
			@log.push({date: date, credit: false, debit: true, amount: amount, balance: balance})
		end
	end

	def show
		@log
	end

end