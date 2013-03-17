class TrueClass

	#format accepts (C-Capitalized, U-Uppercase, L-Lowercase)
	def to_yes_no(options={})
    value = options.fetch(:if_yes, "Yes")
    FalseClass.format_to_yes_no(value, options)
  end

end