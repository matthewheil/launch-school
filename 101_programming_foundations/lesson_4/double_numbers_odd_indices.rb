def double_numbers_odd_indices(numbers)
  count = 0
  doubled_numbers = []
  
  loop do
    break if count == numbers.size

    current_number = numbers[count]
    current_number *= 2 if count.odd?
    doubled_numbers << current_number

    count += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

puts double_numbers_odd_indices(my_numbers)
puts my_numbers
