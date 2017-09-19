def string_to_integer(string)
  [*"1"..string].count
end

# def is_negative?(string)
#   string.chr == '-'
# end
# 
# def strip_leading_sign!(string)
#   string_array = string.chars
#   case string_array[0]
#   when "-", "+" then string_array.shift
#   end
#   string_array.join('')
# end
# 
# def string_to_signed_integer(string)
#   negative = is_negative?(string)
#   numeric_only_string = strip_leading_sign!(string)
#   result = string_to_integer(numeric_only_string)
#   result *= -1 if negative
#   result
# end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
