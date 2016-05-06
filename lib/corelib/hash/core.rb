class Hash

  #This method iterates over the Array as normal #each method.  For each iteration
  #set two variables in the block, |item, flag|. item will be set tot he current item
  #in the iteration; flag will be set to "false" on all iterations except the last iteration
  def each_with_end_flag
    my_size = self.size
    self.each_with_index do |item, index|
      index + 1 == my_size ? yield(item, true) : yield(item, false)
    end
  end

end
