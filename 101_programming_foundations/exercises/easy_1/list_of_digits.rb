# method that takes one argument, a positive integer
# return a list of digits in that number as an array

# original solution I wrote - can't handle multiple 0 digits in a row
# def digit_list(number)
#   array_list = []
#   mod = 10
#   divider = 1
# 
#   loop do
#     break if (number%mod/divider == 0) && (number%(mod*10)/(divider*10) == 0)
#     array_list.unshift(number%mod/divider)
#     mod *= 10
#     divider *= 10
#   end
# 
#   array_list
# end

# refactored after looking at solution
def digit_list(number)
  digits = []
  
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
puts digit_list(100203) == [1, 0, 0, 2, 0, 3]
