class Array

	alias_method :append, :<<
	alias_method :prepend, :unshift
	alias_method :remove, :delete
	alias_method :remove_at, :delete_at
	alias_method :remove_last, :pop
	alias_method :add, :push

end