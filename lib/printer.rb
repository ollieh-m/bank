class Printer

	def initialize
	end

	def printout(array)
		header = header(array.first)
		body = body(array)
		header + "\n" + body			
	end

	private

	def header(hash)
		header = ""
		hash.each_key{ |key| header << "#{key} " }
		header = header.gsub(/ $/,"").gsub(/ /," || ")
	end

	def body(array)
		body = ""
		array.each do |row|
			reformat(row).each_value{ |value| body << "#{value} " }
			body << "\n"
		end
		body = body.gsub(/ $/,"").gsub(/ /," || ").gsub(/  /,' ')
	end

	def reformat(row)
		row[:date] = row[:date].strftime("%d-%m-%Y")
		row[:credit] = row[:credit] > 0 ? "#{row[:credit]}.00" : ""
		row[:debit] = row[:debit] > 0 ? "#{row[:debit]}.00" : ""
		row[:balance] = "#{row[:balance]}.00"
		row
	end

end