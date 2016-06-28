require 'log'

describe Log do

	let(:transaction_date){ double(:deposit_date) }
	let(:transaction_amount){ 5 }
	let(:balance_now){ 10 }
	subject(:log){ described_class.new }

	context '#store' do
		
		it 'adds a hash to the logged array with all the details passed in' do
			log.store(transaction_date,transaction_amount,balance_now)
			expect(log.show).to eq [{date: transaction_date, credit: true, debit: false, amount: transaction_amount}]
		end
	end

end