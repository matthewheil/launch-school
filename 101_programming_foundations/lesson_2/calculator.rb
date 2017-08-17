puts "Please enter a number."
num1 = Kernel.gets().chomp()

puts 'Please enter another number.'
num2 = Kernel.gets().chomp()

puts 'What type of operation would you like: add(a), subtract(s), multiply(m), 
      divide(d)?'
choice = Kernel.gets().chomp()

result = 0

case choice
when 'a' then result = num1 + num2
when 's' then result = num1 - num2
when 'm' then result = num1 * num2
when 'd' then result = num1 / num2
end

Kernel.puts(result)
  