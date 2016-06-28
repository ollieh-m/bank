require_relative 'balance.rb'
require_relative 'log.rb'

class Account

	def initialize(balance = Balance.new, log = Log.new)
		@balance = balance
	end

	def transaction(deposit_or_withdrawal)
		@balance.update(deposit_or_withdrawal.amount)
	end

end