def multiply(numbers, multiplier)
  count = 0

  loop do
    break if count == numbers.size

    numbers[count] *= multiplier

    count += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

puts multiply(my_numbers, 3)
