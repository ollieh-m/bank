require_relative 'balance.rb'
require_relative 'log.rb'

class Account

	def initialize(balance = Balance.new, log = Log.new)
		@balance = balance
		@log = log
	end

	def transaction(deposit_or_withdrawal)
		update_balance(deposit_or_withdrawal.amount)
		update_log(deposit_or_withdrawal)
	end

	private

	def update_balance(amount)
		@balance.update(amount)
	end

	def update_log(object)
		date = object.date
		type = object.amount > 0 ? :credit : :debit
		amount = object.amount > 0 ? object.amount : object.amount * -1
		@log.store(date,type,amount,@balance.now)
	end

end