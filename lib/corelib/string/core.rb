class String

  #TODO - Needs Tests
  def last
    return nil if self.empty?
    self[-1,1]
  end

  #TODO - Needs Tests
  def first
    return nil if self.empty?
    self[0,1]
  end

  #TODO - Needs Tests
  # Combines two strings together with a separator.
  def combine(str, options={})
    strip = options.fetch(:strip, true)
    return compact ? self.strip : self.dup if str.nil? or str.empty?
    return compact ? str.strip : str.dup if self.empty?
    separator = options.fetch(:separator, " ")

    if strip
      pre = self.strip
      post = str.strip
    else
      pre = self.dup
      post = str.dup
    end

    return pre + post if separator.empty?

    # TODO - Support other separators other than spaces.  For instance if someone wanted to join with a comma
    # and pre ended with a comma, we could have an option to disallow repeating
    pre + separator + post

  end

  #Does the same thing as String#contact, but allows a separator to be inserted between the
  #two strings.
  def concat_with(str, separator="")
    return self if str.nil? or str.empty?
    return self.concat(str) if self.empty?
    self.concat(separator) unless separator.empty?
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

  def not_empty?
    !self.empty?
  end

  #Returns the subset of a string from [0, position] if string[position] is a space.
  #If string[max] is not a space, it is assumed we are in the middle of a word.
  #and the logic will increase position a little bit to not break in the middle of a word.
  def excerpt_to_end_of_word(position=nil)
     return self if position.nil? or position >= self.size

     char = self[position]
     return self[0, position].rstrip if char == " "

     self[0,index_of_next_space_from(position)].rstrip
  end

  #Given a position, return the position of the next space
  def index_of_next_space_from(position)
    return nil if self.empty? or position.nil?
    return nil if position >= self.size

    idx = position
    (self.size - position).times do
      idx = idx + 1
      return idx if self[idx] == " "
    end
    idx
  end

end