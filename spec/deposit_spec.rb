require 'deposit'

describe Deposit do

	subject(:deposit){ described_class.new }

	before do
		allow(Date).to receive(:today).and_return(:todays_date)
	end

	context 'On initialization' do

		it 'stores the current date' do
			expect(deposit.date).to eq :todays_date 
		end

	end

end