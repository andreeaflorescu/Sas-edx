#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
	letters = str.downcase.scan(/\w/)
    return letters == letters.reverse
end

def count_words(str)
  words = str.scan(/\w+/)
  hash = Hash.new
  words.each do |word|
  	if hash.has_key?(word.downcase)
  		hash[word] += 1
  	else
  		hash[word.downcase] = 1
  	end
  end
  return hash
end


# #the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


# test_str = "there goes the neighborhood"

# if palindrome? test_str
#   puts test_str + " is a palindrome!"
# else
#   puts test_str + " is NOT a palindrome!"
# end


# test_str = "Madam, I'm Adam"

# if palindrome? test_str
#   puts test_str + " is a palindrome!"
# else
#   puts test_str + " is NOT a palindrome!"
# end


# test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

# word_count = count_words test_str
# puts word_count
