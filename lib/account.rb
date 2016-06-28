require_relative 'balance.rb'
require_relative 'log.rb'

class Account

	def initialize(balance = Balance.new, log = Log.new)
		@balance = balance
		@log = log
	end

	def transaction(deposit_or_withdrawal)
		date = deposit_or_withdrawal.date
		amount = deposit_or_withdrawal.amount
		@balance.update(amount)
		@log.store(date,amount,@balance.now)
	end

end