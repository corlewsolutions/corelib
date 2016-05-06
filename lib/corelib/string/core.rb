class String

  #TODO - Needs Tests
  # Combines two strings together with a separator.
  def combine(*args)
    options = args.extract_options!
    raise ArgumentError, "You need to supply at least one string" if args.empty?
    str = self
    args.each { |val| str = str.priv_combine(val, options) }

    return options.fetch(:if_empty, "") if str.blank?

    prefix = options.fetch(:prefix, nil)
    str = "#{prefix}#{str}"  if options.fetch(:wrap, "true") and (prefix.not_nil?)
    suffix = options.fetch(:suffix, nil)
    str = "#{str}#{suffix}" if options.fetch(:wrap, "true") and (suffix.not_nil?)
    str
  end

  #Does the same thing as String#contact, but allows a separator to be inserted between the
  #two strings.
  def concat_with(str, separator="")
    return self if str.nil? or str.empty?
    return self.concat(str) if self.empty?
    self.concat(separator) unless separator.empty?
    self.concat(str)
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

protected

    def priv_combine(str, options={})
      strip = options.fetch(:strip, true)
      (return strip ? self.strip : self.dup) if str.nil? or str.empty?
      (return strip ? str.strip : str.dup) if self.empty?
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

end
