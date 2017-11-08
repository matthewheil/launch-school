def substrings_at_start(string)
  substring_array = []
  count = 0
  loop do
    substring_array << string[0..count]
    count += 1
    break if count >= string.size
  end
  substring_array.sort { |a, b| a.size <=> b.size }
end

def another_way(string)
  substring_array = []
  1.upto string.size do |count|
    substring_array << string.slice(0, count)
  end
  substring_array.sort { |a, b| a.size <=> b.size }
end

p substrings_at_start('abc') #== ['a', 'ab', 'abc']
p substrings_at_start('a') #== ['a']
p substrings_at_start('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p another_way('abc') #== ['a', 'ab', 'abc']
p another_way('a') #== ['a']
p another_way('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
