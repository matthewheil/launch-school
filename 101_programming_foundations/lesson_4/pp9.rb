def titleize(words)
  words.split.map { |word| word.downcase.capitalize }.join(' ')
end

puts titleize("the flintstones rock")
puts titleize("tHiS aNd THAT")
