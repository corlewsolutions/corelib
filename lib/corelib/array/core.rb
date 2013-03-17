class Array

	def to_yes_no(options={})
    self.collect {|e| e.to_yes_no(options)}
  end

  def add_blank_option(options={})
    doit = options.fetch(:doit, true)
    value = options.fetch(:value, 0)
    label = options.fetch(:label, "")
    self.insert(0, [label, value]) if doit
    self
  end

  def each_with_end_flag
    my_size = self.size
    self.each_with_index do |item, index|
      index + 1 == my_size ? yield(item, true) : yield(item, false)
    end
  end

end