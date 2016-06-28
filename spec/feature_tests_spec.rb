require_relative '../lib/account.rb'
require_relative '../lib/deposit.rb'
require_relative '../lib/withdrawal.rb'
require_relative '../lib/printer.rb'

describe 'banking' do

	let(:account){ Account.new }

	it 'returns the correct string as a bank statement' do
		allow(DateTime).to receive(:now).and_return(DateTime.new(2016,6,28))
		deposit = Deposit.new(amount: 5)
		withdrawal = Withdrawal.new(amount: 3)
		account.transaction(deposit)
		account.transaction(withdrawal)
		statement = account.print_statement
		expect(statement).to eq "date || credit || debit || balance\n28-06-2016 || || 3.00 || 2.00\n28-06-2016 || 5.00 || || 5.00"
	end

end