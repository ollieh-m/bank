require 'account'

describe Account do

	let(:log){ spy(:log) }

	let(:balance){ double(:balance, update: nil, now: :dummy_balance)}
	
	let(:deposit){ double(:transaction, amount: 1) }
	let(:withdrawal){ double(:transaction, amount: -1) }

	subject(:account){described_class.new(balance,log)}

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
				account.transaction(deposit)
				expect(log).to have_received(:store).with(deposit,:dummy_balance)
			end
		end

	end

end