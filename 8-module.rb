class Class

    def attr_accessor_with_history(attr_name)
	attr_name = attr_name.to_s       # make sure it's a string
	attr_reader attr_name            # create the attribute's getter
	attr_reader attr_name+"_history" # create bar_history getter

	# Below I use the class_eval method to define a new setter method on the go.
	class_eval %Q(
	    def #{attr_name}=(attr_name)
		@#{attr_name} = attr_name
		    unless @#{attr_name + "_history"}
			@#{attr_name + "_history"}=[]
			@#{attr_name + "_history"}.push(nil)
		    end
                          
			@#{attr_name + "_history"}.push(attr_name)
	    end
                      )
    end
end

class Foo

    attr_accessor_with_history :bar

end

# Example test case:

f = Foo.new
f.bar = 1
f.bar = 2
p f.bar_history # => if your code works, should be [nil, 1, 2]
f = Foo.new
f.bar = 4
p f.bar_history
