require_relative 'balance.rb'
require_relative 'log.rb'

class Account

	def initialize(balance = Balance.new, log = Log.new, printer = Printer.new)
		@balance = balance
		@log = log
		@printer = printer
	end

	def transaction(deposit_or_withdrawal)
		@balance.update(deposit_or_withdrawal.amount)
		@log.store(deposit_or_withdrawal,@balance.now)
	end

	def print_statement
		@printer.printout(@log.show)
	end

end