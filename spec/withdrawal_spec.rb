require 'withdrawal'

describe Withdrawal do

	subject(:withdrawal_one){ described_class.new(amount: 1) }
	subject(:withdrawal_two){ described_class.new(amount: 2) }

	before do
		allow(DateTime).to receive(:now).and_return(:this_moment)
	end

	context 'On initialization' do
		it 'stores the current date and time' do
			expect(withdrawal_one.date).to eq :this_moment
		end

		it 'stores the amount passed in' do
			expect(withdrawal_one.amount).to eq -1
		end

		it 'stores a different amount passed in' do
			expect(withdrawal_two.amount).to eq -2
		end
	end

end