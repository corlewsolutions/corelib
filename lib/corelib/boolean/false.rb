class FalseClass

  #Cap, Down, Up
	def to_yes_no(options={})
    value = options.fetch(:if_no, "No")
    FalseClass.format_to_yes_no(value, options)
	end

  def self.format_to_yes_no(value, options)
    return value if !options.has_key?(:format) #If format is unspecified, use the default
    format = options[:format]
    return value.upcase if format == "Up"
    return value.downcase if format == "Down"
    value.capitalize   #format has to be capital at this point (or an invalid format, so we will assume capital)
  end

end