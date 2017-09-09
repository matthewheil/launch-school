def prompt(message, style = :puts)
  case style
  when :print then print "==> #{message}"
  when :puts then puts "==> #{message}"
  end
end

def gets_two_numbers
  numbers = []

  prompt("Enter the first number: ", :print)
  numbers << gets.chomp.to_i

  while numbers.size < 2
    prompt("Enter the second number: ", :print)
    number = gets.chomp.to_i
    number != 0 ? (numbers << number) : prompt("Second number can't be zero.")
  end

  numbers
end

numbers = gets_two_numbers
operators = [:+, :-, :*, :/, :%, :**]

operators.each do |operator|
  if operator == :**
    prompt("#{numbers[0]}#{operator}#{numbers[1]}"\
    " = #{numbers.reduce(operator)}")
  else
    prompt("#{numbers[0]} #{operator} #{numbers[1]}"\
    " = #{numbers.reduce(operator)}")
  end
end
