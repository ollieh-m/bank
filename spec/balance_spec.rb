require 'balance'

describe Balance do

	subject(:balance){ described_class.new }

	context 'On initialization' do
		
		it 'Has no funds' do
			expect(balance.now).to eq 0
		end

	end

end

