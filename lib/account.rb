class Account

	def initialize(log: Log.new, printer: Printer.new, overdraft: 0)
		@log = log
		@printer = printer
		@overdraft = overdraft * -1
	end

	def transaction(deposit_or_withdrawal)
		raise 'INSUFFICIENT FUNDS' if insufficient_funds(deposit_or_withdrawal.amount)
		@log.store(deposit_or_withdrawal)
	end

	def print_statement
		@printer.printout(@log.add_balances)
	end

	private

	def insufficient_funds(amount)
		@log.current_balance + amount < @overdraft
	end

end