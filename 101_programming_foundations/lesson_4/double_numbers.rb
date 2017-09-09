# Understand the problem:
#   write a method that accepts an array of numbers and doubles the numbers in the 
#   array in place
#   
# Ex:
#   numbers = [1, 2, 3, 4]
#   double_numbers!(numbers) => [2, 4, 6, 8]
#   
# Input:
#   an array of numbers
#   
# Output:
#   the same array but with numbers doubled
#   
# Logic:
#   def method accepting numbers
#   count = 0
#   loop
#     break if count == numbers.size
#     for the element in numbers at count, double it in place
#       numbers[count] = numbers[count] * 2
#     count += 1
#   end
#   return numbers

def double_numbers!(numbers)
  count = 0
  
  loop do
    break if count == numbers.size

    numbers[count] *= 2

    count += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

puts double_numbers!(my_numbers)
puts my_numbers
