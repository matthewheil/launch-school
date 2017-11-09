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

def palindromes(string)
  substrings_array = substrings(string)
  result = []
  substrings_array.each do |substring| 
    result << substring if substring == substring.reverse && substring.size > 1
  end
  result
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
