require_relative 'log.rb'

class Account

	def initialize(log = Log.new, printer = Printer.new)
		@log = log
		@printer = printer
	end

	def transaction(deposit_or_withdrawal)
		@log.store(deposit_or_withdrawal)
	end

	def print_statement
		@printer.printout(@log.add_balances)
	end

end