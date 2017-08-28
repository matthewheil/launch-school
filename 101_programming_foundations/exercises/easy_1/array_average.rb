def average(numbers)
  sum = 0

  numbers.each { |number| sum += number }

  sum.to_f / numbers.size
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

def another_way(numbers)
  sum = numbers.reduce(:+)
  sum.to_f / numbers.size
end

puts another_way([1, 5, 87, 45, 8, 8])
puts another_way([9, 47, 23, 95, 16, 52])
