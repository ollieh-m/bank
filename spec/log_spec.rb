require 'log'

describe Log do

	let(:deposit){ double(:transaction, date: :dummy_date, amount: 5)}
	let(:withdrawal){ double(:transaction, date: :dummy_date, amount: -5)}

	subject(:log){ described_class.new }

	context '#store' do
		it 'adds a transaction to the log' do
			log.store(deposit)
			expect(log.show).to eq [deposit]
		end
		it 'adds a second transaction to the log after the first' do
			log.store(deposit)
			log.store(withdrawal)
			expect(log.show).to eq [deposit,withdrawal]
		end
	end

	context '#calculate_balances' do
		it 'puts the balance for each transaction in an array of transactions' do
			log.store(deposit)
			log.store(withdrawal)
			expect(log.calculate_balances).to eq [{transaction: deposit, balance: 5},{transaction: withdrawal, balance: 0}]
		end
	end

end