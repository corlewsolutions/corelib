class TrueClass

	#format accepts (C-Capitalized, U-Uppercase, L-Lowercase)
	def to_yes_no(format="C")
		return "yes" if format == "L"
		return "YES" if format == "U"
		"Yes"
	end

end