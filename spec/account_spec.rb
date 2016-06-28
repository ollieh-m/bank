require 'account'

describe Account do

	let(:printer){ spy(:printer) }

	let(:balance){ double(:balance, update: nil, now: :dummy_balance)}
	let(:log){ double(:log, store: nil, show: :dummy_array) }
	
	let(:deposit){ double(:transaction, amount: 1) }
	let(:withdrawal){ double(:transaction, amount: -1) }

	subject(:account){described_class.new(balance,log,printer)}

	context 'Making a transaction' do
		context 'and updating the balance' do
			it '- instructs the balance to update itself using the deposit amount' do
				expect(balance).to receive(:update).with(1)
				account.transaction(deposit)
			end

			it '- instructs the balance to update itself using the withdrawal amount' do
				expect(balance).to receive(:update).with(-1)
				account.transaction(withdrawal)
			end
		end

		context 'and storing it in the log' do
			it '- instructs the log to store transaction and new balance' do
				expect(log).to receive(:store).with(deposit,:dummy_balance)
				account.transaction(deposit)
			end
		end
	end

	context 'Printing a statement' do
		it 'instructs the printer to print a statement' do
			account.print_statement
			expect(printer).to have_received(:printout).with(:dummy_array)
		end
	end

end