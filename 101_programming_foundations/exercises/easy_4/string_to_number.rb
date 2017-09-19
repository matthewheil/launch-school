def string_to_integer(string)
  [*"1"..string].count
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# another_way

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def another_way(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p another_way('4321') == 4321
p another_way('570') == 570