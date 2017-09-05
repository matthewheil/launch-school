def sum(number)
  arr = number.to_s.split('')
  arr.each_index do |index|
    arr[index] = arr[index].to_i
  end
  arr.reduce(:+)
end

def another_way(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
