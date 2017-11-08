def word_prompt(type)
  word = ''
  loop do
    puts "Please enter a #{type}:"
    word = gets.chomp
    break unless word.empty?
    puts "The word cannot be empty."
  end
  word
end

def madlib
  noun = word_prompt("noun")
  verb = word_prompt("verb")
  adverb = word_prompt("adverb")
  adjective = word_prompt("adjective")
  puts "The #{adjective} #{noun} #{verb} #{adverb}."
end

madlib

# Example
# 
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
# 
# Do you walk your blue dog quickly? That's hilarious!

# Understand the problem:
#   create a method that takes no arguments
#     the method should prompt for a noun, verb, adverb, and adjective
#     injects those into a sentence
#     prints the sentence