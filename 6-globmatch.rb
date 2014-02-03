def glob_match(filenames, pattern)
=begin
Filenames is an array of strings, so want to iterate through filenames to find those strings that match the pattern. fnmatch(pattern, m) compares the string value of pattern to the individual strings in filenames. For each string that matches, will input that string into array matches, and then it increments the position in matches to assign the next matching string to the next position.
=end

    matches = []

    # Replaces all "*" with ".*" all "." with "\.", and all "?" with "."
    pattern.gsub!(/[\*\?\.]/, '*' => '.*', '.' => '\.', '?' => '.')
    filenames.each do |m|
	if File.fnmatch(pattern, m)
	    matches.push(m)
	end
    end
end

p glob_match(['part1.rb', 'part2.rb', 'part2.rb~', '.part3.rb.un~'], '*part*rb?*')

#Why don't periods work???
