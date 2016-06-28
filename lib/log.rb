class Log

	def initialize
		@log = []
	end

	def store(transaction)
		@log.push(transaction)
	end

	def calculate_balances
		balance = 0
		@log.map do |transaction|
			balance += transaction.amount
			transaction = {transaction: transaction, balance: balance}
		end
	end

	def show
		@log
	end

end