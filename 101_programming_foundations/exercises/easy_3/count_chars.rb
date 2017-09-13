print "Please write word or multiple words: "
words = gets.chomp

# num_of_chars = words.split.join.chars.count
num_of_chars = words.delete(' ').size

puts "There are #{num_of_chars} characters in \"#{words}\"."
