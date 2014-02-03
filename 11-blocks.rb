class CartesianProduct
    include Enumerable
=begin
Define product as a new Array, and then want to put each value of the parameters into product. Use a.each do to go through the items of a, and b.each do inside that to go through the items of b. Use push to insert items into product.

=end

    def initialize(a,b)
	product = Array.new
	a.each do |x|
	    b.each do |y|
		product.push([x,y])
	    end
	end
    print product	
    end
end

a=[1,2,3,4]
b=["a","s","d","f"]
c=CartesianProduct.new(a,b)
