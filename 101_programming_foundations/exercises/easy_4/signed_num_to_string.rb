DIGITS = [*'0'..'9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(num)
  result = num < 0 ? (integer_to_string(-num)) : (integer_to_string(num))
  case num <=> 0
  when -1 then "-#{result}"
  when +1 then "+#{result}"
  else         "#{result}"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
