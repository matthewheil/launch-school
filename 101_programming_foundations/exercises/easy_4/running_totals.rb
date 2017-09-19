def running_total(numbers)
  running_total = 0
  numbers.map { |number| running_total += number }
end

def another_way(numbers)
  sum = 0
  numbers.each_with_object([]) { |number, arr| arr << sum += number }
end

def yet_another_way(numbers)
  running_total_array = []
  numbers.each_with_index do |number, index|
    running_total_array << numbers[0, number.index].reduce(:+)
  end
  running_total_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p another_way([2, 5, 13]) == [2, 7, 20]
p another_way([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p another_way([3]) == [3]
p another_way([]) == []

p yet_another_way([2, 5, 13]) == [2, 7, 20]
p yet_another_way([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p yet_another_way([3]) == [3]
p yet_another_way([]) == []