require 'account'

describe Account do

	let(:balance){ spy(:balance) }
	let(:deposit){ double(:deposit, amount: 1) }
	subject(:account){described_class.new(balance)}

	context 'Making a transaction' do

		it 'instructs the balance to update itself using the deposit amount' do
			account.transaction(deposit)
			expect(balance).to have_received(:update).with(1)
		end

	end

end