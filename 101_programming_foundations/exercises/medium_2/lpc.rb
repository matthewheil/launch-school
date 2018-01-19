# lettercase percentage ratio

# Understand the problem:
#   create a method that takes a string as input
#   return a hash that has 3 entries: lowercase, uppercase, neither
#     each number is a percentage of that type in the string
#   assume that the string always contains at least one character

# Logic:
#   create a hash
#   have a value for the size of the string
#   have variables for the count of each: lowercase, uppercase, neither
#   find the number of lowercase characters
#   find the number of uppercase characters
#   find the number of all other characters
#     can do string's size minus uppercase + lowercase
#   update the hash with the percentages

def letter_percentages(string)
  lower_alphabet = 'abcdefghijklmnopqrstuvwxyz'
  upper_alphabet = lower_alphabet.upcase
  percentages = { lowercase: 0, uppercase: 0, neither: 0 }

  lowercase_count = string.count(lower_alphabet)
  uppercase_count = string.count(upper_alphabet)
  neither_count = string.size - (lowercase_count + uppercase_count)

  percentages[:lowercase] = (lowercase_count.to_f / string.size) * 100
  percentages[:uppercase] = (uppercase_count.to_f / string.size) * 100
  percentages[:neither] = (neither_count.to_f / string.size) * 100

  percentages
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
