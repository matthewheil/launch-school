def penultimate(words)
  words.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(words)
  words_array = words.split
  case words_array.size
  when 0 then return "The string is empty."
  when 1 then return words_array.first
  else        return words_array[words_array.size/2]
  end
end

p middle_word('')
p middle_word('this')
p middle_word('this has even words')
p middle_word('this has an odd number of words')
