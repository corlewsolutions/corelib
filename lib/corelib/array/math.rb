#  options = {:key1 => 'default'}.merge(options)

class Array

	def sum (options = {})
		strict = options.fetch(:strict, true)		
		strict ? sum_strict : sum_loose
	end

	private

	def sum_strict
		total = 0
		self.each {|item| total = total + item }
		total
	end 

	def sum_loose
		total = 0
		self.each do |item| 
			val = item.is_a?(Numeric) ? item : 0
			total = total + val 
		end
		total
	end 

end