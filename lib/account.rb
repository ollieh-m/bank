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

		if deposit_or_withdrawal.amount > 0 
			type = :credit
		else
			type = :debit
			amount *= -1
		end

		@log.store(date,type,amount,@balance.now)
	end

end