class TrueClass

	#format accepts (C-Capitalized, U-Uppercase, L-Lowercase)
	def to_yes_no(options={})
    options.fetch(:if_yes, "Yes")
  end

end