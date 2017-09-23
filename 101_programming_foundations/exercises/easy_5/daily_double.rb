def crunch(silly_string)
  fixed_words = silly_string.split.map do |word|
    fixed_word = ''
    return fixed_word if word.empty?
    fixed_word[0] = word[0]
    count = 0
    loop do
      count += 1
      break if count >= word.size
      word[(count - 1)] == word[count] ? next : fixed_word.concat(word[count])
    end
    fixed_word
  end
  fixed_words.join(' ')
end

def another_way(text)
  index = 0
  fixed_text = ''
  while index <= text.length - 1
    fixed_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  fixed_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('gggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
