def short_long_short(str1, str2)
  return puts "The two strings are the same size." if str1.size == str2.size
  str1.size > str2.size ? (str2 + str1 + str2) : (str1 + str2 + str1)
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
