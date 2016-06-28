require 'balance'

class Account

	def initialize(balance = Balance.new)
		@balance = balance
	end

	def transaction(deposit_or_withdrawal)
		@balance.update(deposit_or_withdrawal.amount)
	end

end