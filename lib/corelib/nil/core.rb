class NilClass

  def to_yes_no(options={})
    options.fetch(:if_nil, "")
  end

  def not_nil?
    false
  end

end