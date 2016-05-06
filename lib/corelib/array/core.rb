class Array

  def add_blank_option(options={})
    doit = options.fetch(:doit, true)
    value = options.fetch(:value, 0)
    label = options.fetch(:label, "")
    self.insert(0, [label, value]) if doit
    self
  end

  def add_all(arr, options={})
    flatten = options.fetch(:flatten, true)
    a = flatten ? arr.flatten : arr
    self.concat(a)
  end

end
