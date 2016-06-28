require 'account'

describe Account do

	let(:printer){ spy(:printer) }

	let(:log){ double(:log, store: nil, add_balances: :dummy_array, current_balance: 0) }
	
	let(:deposit){ double(:transaction, amount: 1) }
	let(:withdrawal){ double(:transaction, amount: -1) }

	subject(:account){described_class.new(log: log, printer: printer)}

	context 'Making a transaction' do
		it 'instructs the log to store the transaction' do
			expect(log).to receive(:store).with(deposit)
			account.transaction(deposit)
		end
		it 'but raises an error if the withdrawal would make the balance exceed the overdraft' do
			expect{account.transaction(withdrawal)}.to raise_error('INSUFFICIENT FUNDS')
		end
		it 'with no error if the overdraft is not exceeded' do
			new_account = Account.new(overdraft: 5)
			expect{new_account.transaction(withdrawal)}.not_to raise_error
		end
	end

	context 'Printing a statement' do
		it 'instructs the printer to print a statement using the log array with balances' do
			account.print_statement
			expect(printer).to have_received(:printout).with(:dummy_array)
		end
	end

end