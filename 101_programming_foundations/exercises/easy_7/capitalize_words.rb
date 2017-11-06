def word_cap(string)
  words_array = []
  string.split.each do |word|
    word[0] = word[0].upcase
    words_array << word
  end
  words_array.join(' ')
end

def another_way(string)
  string.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'

p another_way('four score and seven') #== 'Four Score And Seven'
p another_way('the javaScript language') #== 'The Javascript Language'
p another_way('this is a "quoted" word') #== 'This Is A "quoted" Word'

# Logic:
#   split the string
#   iterate over the words
#     for each word
#     do character assignment for the first letter as capitalized
#   return the string