# Purpouse: given an array of strings words, groups the input words into anagram groups.
# Case doesn't matter in classifying strings as anagrams (but case should be preserved in the output),
# and the order of the anagrams in the groups doesn't matter.
# The output should be an array of anagram groups (i.e. an array of arrays).


# sort a string case insensitive by spliting it to an array
def sorted(word) 
	return word.split('').sort { |a, b| a.casecmp(b) } .join
end

# search in the anagram list for a list containing anagram of the
# given word
def search_anagram_match(anagram_list, word)
	last = anagram_list.length - 1
	for i in 0..last
		#if the word exist in the i-th anagram list
		if sorted(anagram_list[i][0]).casecmp(sorted(word)) == 0
			return i
		end
	end
	return -1
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
	words.each do |word|
		if anagram_list.length == 0
			anagram_list.push([word])
		else
			index = search_anagram_match(anagram_list, word)
			if index == -1
				anagram_list.push([word])
			else
				anagram_list[index].push(word)
			end
		end
	end
	return anagram_list
end
