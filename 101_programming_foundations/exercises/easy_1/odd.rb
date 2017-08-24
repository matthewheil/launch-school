def odd?(num)
  absolute(num).remainder(2) == 1
end

def absolute(num)
  if num < 0
    num * -1
  else
    num
  end
end

puts odd?(2)
puts odd?(5)
puts odd?(-17)
puts odd?(-8)
puts odd?(0)
puts odd?(7)
