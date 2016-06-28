class Log

	def initialize
		@log = []
	end

	def store(transaction)
		@log.push(transaction)
	end

	def add_balances
		balance = 0
		array = @log.map do |transaction|
			balance += transaction.amount
			transaction = {transaction: transaction, balance: balance}
		end
		array.reverse
	end

end