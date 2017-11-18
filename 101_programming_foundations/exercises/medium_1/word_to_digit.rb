WORD_TO_DIGIT = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
                  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8',
                  'nine' => '9' }

def word_to_digit(string)
  string.gsub(/\w+/) do |word|
    if WORD_TO_DIGIT.keys.include?(word)
      WORD_TO_DIGIT[word]
    else
      word
    end
  end
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# understand the problem:
#   create a method that takes a string as an argument
#   return the same string that uses digits instead of words for the numbers
# 
# logic:
#   create a constant (hash) that maps the english word as a key to the digit as a value
#   use gsub instead -- if the second argument is a hash, and the matched text is one of its keys, 
#   the corresponding value is the replacement string. this replaced words that were keys
#   but it replaced words without keys with spaces
#   used if else condition to replace word with value from hash or just the word