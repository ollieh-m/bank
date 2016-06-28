require 'printer'

describe Printer do

	let(:deposit){ double(:deposit, date: DateTime.new(2001,2,3), amount: 5) }
	let(:withdrawal){ double(:withdrawal, date: DateTime.new(2001,2,4), amount: -5) }

	let(:array){ [{transaction: deposit, balance: 10},
								{transaction: withdrawal, balance: 10}] }
	subject(:printer){ described_class.new }

	context '#reformat' do
		it 'creates a new array of hashes with the correct keys and values' do
			reformatted_array = printer.reformat(array)
			expect(reformatted_array).to eq [{date: '03-02-2001', credit: '5.00', debit: '', balance: '10.00'},
													 						 {date: '04-02-2001', credit: '', debit: '5.00', balance: '10.00'}]
		end
	end

	context '#printout' do
		let(:printout){ printer.printout(array) }

		it 'uses keys from the first hash in the reformatted array as the header' do
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