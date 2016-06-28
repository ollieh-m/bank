require 'balance'

class Account

	def initialize(balance = Balance.new)
		@balance = balance
	end

	def transaction(deposit_object)
		@balance.update(deposit_object.amount)
	end

end