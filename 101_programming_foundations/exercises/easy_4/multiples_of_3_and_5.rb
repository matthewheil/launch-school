def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(number)
  numbers = [*1..number]
  multiples_array = []
  
  numbers.each do |num| 
    multiples_array << num if multiple?(num, 3) || multiple?(num, 5)
  end
  
  multiples_array.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
