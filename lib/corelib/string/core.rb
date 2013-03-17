class String

  #Does the same thing as String#contact, but allows a separator to be inserted between the
  #two strings.
  def concat_with(str, separator="")
    return self if str.nil? or str.empty?
    return self.concat(str) if self.empty?
    self.concat(separator) if !separator.empty?
    self.concat(str)
  end

  def to_yes_no(options={})
		self.to_bool(options).to_yes_no(options)
	end

	#true will always be returned if we can clearly match one of the true cases
	#In unstrict mode, the string is assumed false if we cannot match true
	#In strict mode, the string must clearly match a false condition to return false
	#otherise an error is raised
  def to_bool(options={})
    strip = options.fetch(:strip, true)
    strict = options.fetch(:strict, false)
    str = strip ? self.strip : self
    return true if str =~ /\A(true|t|yes|y|1)\Z/i

    if strict
      return false if str.empty? || str =~ /\A(false|f|no|n|0)\Z/i
        raise ArgumentError.new("cannot convert \"#{str}\" to boolean")
    end

    false
  end

  def excerpt_to_end_of_word(max=nil)
     return self if max.nil? or max >= self.size

     char = self[max]
     return self[0,max].rstrip if char == " "

     self[0,index_of_next_space_from(max)].rstrip
  end

  def index_of_next_space_from(pos)
    return 0 if self.empty?
    idx = pos
    (self.size - pos).times do
      idx = idx + 1
      return idx if self[idx] == " "
    end
    idx
  end

end