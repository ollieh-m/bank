class Printer

	def initialize
	end

	def printout(array)
		header = header(array.first)
	end

	private

	def header(hash)
		header = ""
		hash.each_key{ |key| header << "#{key} " }
		header = header.gsub(/(\w)( )(\w)/){"#{$1} || #{$3}"}
	end

end