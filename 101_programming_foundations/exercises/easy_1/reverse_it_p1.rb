# write a method that tkaes one argument, a string, and returns the same string
# with the words in the reverse order.
#
# take a string as parameter
# split the string based on space
# reverse the array of words then join together and print to screen

def reverse_sentence(words)
  words.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'