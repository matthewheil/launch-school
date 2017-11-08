def substrings_at_start(string)
  substring_array = []
  1.upto string.size do |count|
    substring_array << string.slice(0, count)
  end
  substring_array.sort { |a, b| a.size <=> b.size }
end

def substrings(string)
  substrings = []
  (0...string.size).each do |index|
    this_substring = string[index..-1]
    substrings.concat(substrings_at_start(this_substring))
  end
  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
