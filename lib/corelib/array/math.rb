class Array

	def sum
		total = 0
		self.each {|item| total = total + item }
		total
	end

end