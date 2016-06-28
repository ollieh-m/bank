# require_relative '../lib/account.rb'
# require_relative '../lib/balance.rb'
# require_relative '../lib/deposit.rb'
# require_relative '../lib/withdrawal.rb'
# require_relative '../lib/printer.rb'

# puts "Initialize account with a balance..."
# balance = Balance.new
# account = Account.new(balance)
# puts "Current balance is #{balance.now}"
# puts
# puts "Deposit 5"
# deposit = Deposit.new(amount: 5)
# account.transaction(deposit)
# puts "Current balance is #{balance.now}"
# puts
# puts "Withdraw 3"
# withdrawal = Withdrawal.new(amount: 3)
# account.transaction(withdrawal)
# puts "Current balance is #{balance.now}"

# account = Account.new
# account.transaction(deposit)
# account.transaction(deposit)
# account.transaction(withdrawal)
# puts account.print_statement