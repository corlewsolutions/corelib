class String

	#format accepts (C-Capitalized, U-Uppercase, L-Lowercase)
	def to_yes_no(format="C", strict=false)
		self.to_bool(strict).to_yes_no(format)
	end

	#true will always be returned if we can clearly match one of the true cases
	#In unstrict mode, the string is assumed false if we cannot match true
	#In strict mode, the string must clearly match a false condition to return false
	#otherise an error is raised
  	def to_bool(strict=false)
    	return true if self =~ (/\A(true|t|yes|y|1)\Z/i)

    	if strict
    		return false if self.empty? || self =~ (/\A(false|f|no|n|0)\Z/i)
    	    raise ArgumentError.new("cannot convert \"#{self}\" to boolean")
    	end

    	false
  	end

end