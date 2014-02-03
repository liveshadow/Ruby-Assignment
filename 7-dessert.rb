class Dessert

    def initialize(name, calories)
	@n = name
	@cal = calories
	#puts @n
	#puts @cal

    end

    def name=(new_name)	#setter method
	@n = new_name
    end

    def name	#getter method
	@n
    end

    def cal=(new_cal)	#setter method
	@cal = new_cal
    end

    def cal	#getter method
	@cal
    end

    def healthy?
	if @cal < 200
	   return true
	else 
	   return false
	end
    end

    def delicious?
	return true
    end
end

#just = Dessert.new("jello", 7000000000)
#puts just.healthy?

class JellyBean < Dessert

    def initialize(name, calories, flavor)
	@n = name
	@cal = calories
	@flav = flavor
    end    

    def flavor=(new_flavor)	#setter method
	@flav = new_flavor
    end

    def flavor	#getter method
	@flav
    end

    def delicious?
	if @flav == "black licorice"
	   return false
	else
	   return true
	end
    end

end

just = JellyBean.new("jello", 199, "black licorice")
just.flavor=("strawberry")
puts just.healthy?
puts just.flavor
puts just.delicious?
