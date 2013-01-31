class FalseClass

	def to_yes_no(format="C")
		return "no" if format == "L"
		return "NO" if format == "U"
		"No"
	end

end