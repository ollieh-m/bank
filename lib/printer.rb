class Printer

	def initialize
	end

	def printout(array)
		header = ""
		array.first.each_key do |key|
			header << "#{key} "
		end
		header = header.gsub(/(\w)( )(\w)/){"#{$1} || #{$3}"}
		header
	end

end