require 'printer'

describe Printer do

	let(:array){ [{date: DateTime.new(2001,2,3), credit: 5, debit: 0, balance: 10}] }
	subject(:printer){ described_class.new }

	context '#print' do
		it 'uses keys from the first hash in an array as headers' do
			printout = printer.printout(array)
			match = printout =~ /date || credit || debit || balance/
			expect(match).to eq 0
		end
	end

end