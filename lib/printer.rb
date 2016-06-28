class Printer

	def initialize
	end

	def printout(array)
		header = header(array.first)

		header = ""
		array.first.each_key do |key|
			header << "#{key} "
		end
		header = header.gsub(/(\w)( )(\w)/){"#{$1} || #{$3}"}
		header
	end

	private

	def header(hash)
		header = ""
		hash.each_key{ |key| header << "#{key} " }
		header = header.gsub(/(\w)( )(\w)/){"#{$1} || #{$3}"}
	end

end