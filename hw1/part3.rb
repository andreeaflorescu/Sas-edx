# Purpouse: given an array of strings words, groups the input words into anagram groups.
# Case doesn't matter in classifying strings as anagrams (but case should be preserved in the output),
# and the order of the anagrams in the groups doesn't matter.
# The output should be an array of anagram groups (i.e. an array of arrays).


# sort a string case insensitive by spliting it to an array
def sorted(word) 
	return word.split('').sort { |a, b| a.casecmp(b) } .join
end

# combine all anagrams from the word array into the anagram list
# input: ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 
# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]
def combine_anagrams(words)
	anagram_list = Array.new
	anagram_list = words.map {|word| sorted(word).downcase}
	anagram_list.uniq!
	
	result = Array.new
	anagram_list.each do |anagram|
		result << words.select {|word| sorted(word).casecmp(sorted(anagram)) == 0}
	end
	result
end
