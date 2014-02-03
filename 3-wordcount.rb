   def count_words(string)
	frequencies = Hash.new(0)
	string.downcase!.gsub!(/[_\W]/," ")
	words = string.split
	words.each do |word|
	   frequencies[word] += 1
	end
	return frequencies
   end

count_words("A man, a plan, a canal, -- Panama")

