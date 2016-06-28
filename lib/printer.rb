class Printer

	def initialize
	end

	def printout(array)
		header = header(array.first)
		body = body(array)
		header + "\n" + body
	end

	def reformat(array)
		array.map do |hash|
			hash = {date: datify(hash[:transaction].date),
							credit: hash[:transaction].amount > 0 ? numberfy(hash[:transaction].amount) : "",
							debit: hash[:transaction].amount < 0 ? numberfy(hash[:transaction].amount * -1) : "",
							balance: numberfy(hash[:balance])}
		end
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

	def datify(date)
		date.strftime("%d-%m-%Y")
	end

	def numberfy(amount)
		"#{amount}.00"
	end

end