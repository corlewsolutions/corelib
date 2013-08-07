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

  #This method iterates over the Array as normal #each method.  For each iteration
  #set two variables in the block, |item, flag|. item will be set tot he current item
  #in the iteration; flag will be set to "false" on all iterations except the last iteration
  def each_with_end_flag
    my_size = self.size
    self.each_with_index do |item, index|
      index + 1 == my_size ? yield(item, true) : yield(item, false)
    end
  end

  def not_empty?
    !self.empty?
  end

  def add_all(arr, options={})
    flatten = options.fetch(:flatten, true)
    a = flatten ? arr.flatten : arr
    self.concat(a)
  end

end