require 'deposit'

describe Deposit do

	subject(:deposit_one){ described_class.new(amount: 1) }

	before do
		allow(Date).to receive(:today).and_return(:todays_date)
	end

	context 'On initialization' do

		it 'stores the current date' do
			expect(deposit_one.date).to eq :todays_date 
		end

		it 'stores the amount passed in' do
			expect(deposit_one.amount).to eq 1
		end

	end

end