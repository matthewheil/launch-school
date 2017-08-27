# write a method that takes one or more words, and returns the given string with
# all give or more letter words reverseed. each string will consist of only
# letters and spaces. spaces should be included only when more than one word is 
# present
#
# take a string as parameter
# split the string based on space
# any word with 5 or more letters: split, reverse, join

def reverse_words(words)
  words = words.split
  i = 0

  while i < words.count do
    words[i].replace(words[i].reverse) if words[i].size >= 5
    i += 1
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# another way
def another_way(string)
  words = []
  
  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end
  
  words.join(' ')
end

puts another_way('Professional')          # => lanoisseforP
puts another_way('Walk around the block') # => Walk dnuora the kcolb
puts another_way('Launch School')         # => hcnuaL loohcS

# Nick Johnson's solution
def nj_reverse_words(str)
  str.gsub(/\w{5,}/, &:reverse)
end