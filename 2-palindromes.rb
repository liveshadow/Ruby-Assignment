class Palindrome
    def palindrome?(string)

	string.downcase!	#similar to string = string.downcase - sets 					the value of string to new value (downcased)
	
	string.gsub!(/[_\W]/,"")	#similar to string = string.gsub - 						sets value of string to new value 						(with all spaces and special 						characters removed)
	        
	return string == string.reverse

    end
end

f = Palindrome.new
puts f.palindrome?("A man, a plan, a canal -- Panama")
