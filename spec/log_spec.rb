require 'log'

describe Log do

	let(:transaction_date){ double(:transaction_date) }
	let(:transaction_amount_deposit){ 5 }
	let(:transaction_amount_withdrawal){ -5 }
	let(:balance_now){ 10 }
	subject(:log){ described_class.new }

	context '#store' do
		
		it 'adds a hash to the logged array with all the deposit details passed in' do
			log.store(transaction_date,transaction_amount_deposit,balance_now)
			expect(log.show).to eq [{date: transaction_date, credit: 5, debit: 0, balance: balance_now}]
		end

		it 'adds a hash to the logged array with all the withdrawal details passed in' do
			log.store(transaction_date,transaction_amount_withdrawal,balance_now)
			expect(log.show).to eq [{date: transaction_date, credit: 0, debit: 5, balance: balance_now}]
		end

	end

end