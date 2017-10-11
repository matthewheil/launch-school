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

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
