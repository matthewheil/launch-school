def stringy(size, start = 1)
  string = ''
  count = 1
  
  if start == 1
    while count <= size
      count.odd? ? string << '1' : string << '0'
      count += 1
    end
  else
    while count <= size
      count.odd? ? string << '0' : string << '1'
      count += 1
    end
  end
  
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'

def another_way(size, start = 1)
  numbers = []
  
  if start == 1
    size.times { |index| numbers << (index.even? ? 1 : 0) }
  else
    size.times { |index| numbers << (index.even? ? 0 : 1) }
  end
  
  numbers.join
end

puts another_way(6) == '101010'
puts another_way(9) == '101010101'
puts another_way(4) == '1010'
puts another_way(7) == '1010101'
puts another_way(6, 0) == '010101'
puts another_way(9, 0) == '010101010'
puts another_way(4, 0) == '0101'
puts another_way(7, 0) == '0101010'