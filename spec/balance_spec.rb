require 'balance'

describe Balance do

	subject(:balance){ described_class.new }

	context 'On initialization' do
		it 'Has no funds' do
			expect(balance.now).to eq 0
		end
	end

	context '#update' do
		it 'adds the amount passed in if the amount is positive' do
			balance.update(1)
			expect(balance.now).to eq 1
		end
		it 'subtracts the amount passed in if the amount is negative' do
			balance.update(-1)
			expect(balance.now).to eq -1
		end
	end

end

