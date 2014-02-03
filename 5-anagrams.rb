def combine_anagrams(words)
    # copies words into word_copy

=begin
    word_copy = Array.new(words)
    word_copy = words.each.collect do |w|
	w.downcase!
	w.chars.sort.join
    end
    puts word_copy
=end

=begin
	Takes words and, for all strings in words, represented by "i", downcases them, breaks them into an array of chars, sorts the chars, and joins them back into a string. Group_by stores all sorted strings as keys in the hash and each key has the words with those same letters as the values. Then .values takes all values in the grouped hash and puts those values into an array.
=end

    word_hash = words.group_by {|i| i.downcase.chars.sort.join}.values
    print word_hash

end

combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
