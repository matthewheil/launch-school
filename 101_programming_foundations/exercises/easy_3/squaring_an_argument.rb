def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64

def power_to_n(num, power)
  result = 1
  if power.even?
    (power / 2).times do
      result *= multiply(num, num)
    end
  else
    (power / 2).times do
      result *= multiply(num, num)
    end
    result *= num
  end

  result
end

p power_to_n(5, 4)
p power_to_n(2, 4)
p power_to_n(3, 5)
