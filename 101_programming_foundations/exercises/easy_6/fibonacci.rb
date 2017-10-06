def find_fibonacci_index_by_length(length)
  previous_number = 0
  current_number = 1
  count = 1
  
  loop do
    if current_number.to_s.size == length
      return count
    else
      next_number = previous_number + current_number
      previous_number = current_number
      current_number = next_number
      count += 1
    end
  end
end

p find_fibonacci_index_by_length(2)     == 7
p find_fibonacci_index_by_length(10)    == 45
p find_fibonacci_index_by_length(100)   == 476
p find_fibonacci_index_by_length(1000)  == 4782
p find_fibonacci_index_by_length(10000)  == 47847

# Logic:
# 1, 1, 2, 3, 5, 8, 13
#   make a loop with a counter starting at 1
#   loop so that you go through the fibonacci sequence
#     previous number = 0
#     current number = 1
#       check
#   check how many digits are in the current number at each loop
#   if the number has the same number of digits as the parameter return the current count
#     logic
#     if parameter.to_s.size == current number.to_s.size
#   else
#     next number = previous number + current number
#     previous number = current number
#     current number = next number
#     count += 1