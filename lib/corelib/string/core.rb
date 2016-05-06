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
