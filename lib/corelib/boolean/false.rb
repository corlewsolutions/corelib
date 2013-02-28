class FalseClass

	def to_yes_no(options={})
    options.fetch(:if_no, "No")
	end

end