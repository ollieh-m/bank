require 'log'

describe Log do

	let(:deposit){ double(:transaction, date: :dummy_date, amount: 5)}
	let(:withdrawal){ double(:transaction, date: :dummy_date, amount: -5)}

	subject(:log){ described_class.new }

	context '#add_balances' do
		it 'adds the balance for each transaction in a chronological transactions array' do
			log.store(deposit)
			log.store(withdrawal)
			expect(log.add_balances).to eq [{transaction: withdrawal, balance: 0},{transaction: deposit, balance: 5}]
		end
	end

	context '#current_balance' do
		it 'calculates the current balance' do
			log.store(deposit)
			log.store(withdrawal)
			expect(log.current_balance).to eq 0
		end
		it 'calculates a different balance' do
			log.store(deposit)
			log.store(deposit)
			log.store(withdrawal)
			expect(log.current_balance).to eq 5
		end
	end

end