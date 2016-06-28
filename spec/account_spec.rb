require 'account'

describe Account do

	let(:printer){ spy(:printer) }

	let(:log){ double(:log, store: nil, add_balances: :dummy_array) }
	
	let(:deposit){ double(:transaction, amount: 1) }
	let(:withdrawal){ double(:transaction, amount: -1) }

	subject(:account){described_class.new(log,printer)}

	context 'Making a transaction' do
		it 'instructs the log to store the transaction' do
			expect(log).to receive(:store).with(deposit)
			account.transaction(deposit)
		end
	end

	context 'Printing a statement' do
		it 'instructs the printer to print a statement using the log array with balances' do
			account.print_statement
			expect(printer).to have_received(:printout).with(:dummy_array)
		end
	end

end