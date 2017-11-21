=begin
  Understand the problem:
    Create a method that takes a text file as input.
    Return the longest sentence in that file as well as the number of words in the longest sentence.
  
  Logic:
    Use #scan with a regular expression to store each sentence into an array
    create a variable, longest sentence
    iterate through each sentence in the array
      store sentence into longest sentence variable if sentence.size > longest sentence.size
    output "The longest sentence in this text file is #{longest sentence.size} words."
    return longest sentence
=end

def get_sentences(file_name)
  sentences = []
  File.read(file_name).scan(/([^.!?]+)/).each do |array|
    array.each do |sentence|
      sentences << sentence.split("\n").join(' ')
    end
  end
  sentences
end

def longest_sentence(file_name)
  longest = ''
  sentences = get_sentences(file_name)
  sentences.each do |sentence|
    longest = sentence if sentence.split.size > longest.split.size
  end
  num_words = longest.split.size
  puts "The longest sentence in the given file is #{num_words} words."
  p longest
end

longest_sentence('long_sent_file.txt')
longest_sentence('pg84.txt')