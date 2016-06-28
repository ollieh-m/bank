require 'printer'

describe Printer do

	let(:array){ [{date: DateTime.new(2001,2,3), credit: 5, debit: 0, balance: 10},
								{date: DateTime.new(2001,2,4), credit: 0, debit: 5, balance: 10}] }
	subject(:printer){ described_class.new }

	let(:printout){ printer.printout(array) }

	context '#print' do

		it 'uses keys from the first hash in an array as headers' do
			match = printout =~ /date \|\| credit \|\| debit \|\| balance/
			expect(match).to eq 0
		end
		it 'adds the values from the first hash to a new line on the printout' do
			row = printout.split("\n")[1]
			expect(row).to eq '03-02-2001 || 5.00 || || 10.00'
		end
		it 'adds the values from the second hash to a new line on the printout' do
			row = printout.split("\n")[2]
			expect(row).to eq '04-02-2001 || || 5.00 || 10.00'
		end
	end

end