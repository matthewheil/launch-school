def letter_frequency(statement)
  result = {}
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  
  letters.each do |letter|
    letter_frequency = statement.scan(letter).count
    result[letter] = letter_frequency if letter_frequency > 0
  end
  
  result
end

puts letter_frequency("The Flintstones Rock")
puts letter_frequency("My name is Matthew.")
