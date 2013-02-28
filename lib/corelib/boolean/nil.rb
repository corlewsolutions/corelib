class NilClass

  def to_yes_no(options={})
    options.fetch(:if_nil, "")
  end

end