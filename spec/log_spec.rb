require 'log'

describe Log do

	let(:transaction_date){ double(:transaction_date) }
	let(:transaction_amount){ 5 }
	let(:balance_now){ 10 }
	subject(:log){ described_class.new }

	context '#store' do
		
		it 'adds a hash to the logged array with all the deposit details passed in' do
			transaction_type = :credit
			log.store(transaction_date,transaction_type,transaction_amount,balance_now)
			expect(log.show).to eq [{date: transaction_date, credit: true, debit: false, amount: transaction_amount, balance: balance_now}]
		end

		it 'adds a hash to the logged array with all the withdrawal details passed in' do
			transaction_type = :debit
			log.store(transaction_date,transaction_type,transaction_amount,balance_now)
			expect(log.show).to eq [{date: transaction_date, credit: false, debit: true, amount: transaction_amount, balance: balance_now}]
		end

	end

end