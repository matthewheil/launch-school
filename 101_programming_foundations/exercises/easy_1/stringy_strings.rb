def stringy(size)
  string = ''
  count = 1
  
  while count <= size
    count.odd? ? string << '1' : string << '0'
    count += 1
  end
  
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

def another_way(size)
  numbers = []
  
  size.times { |index| numbers << (index.even? ? 1 : 0) }
  
  numbers.join
end

puts another_way(6) == '101010'
puts another_way(9) == '101010101'
puts another_way(4) == '1010'
puts another_way(7) == '1010101'