def rotate_array(array)
  array[1..-1] << array.first
end

def rotate_rightmost_digits(number, last_n)
  num_array = number.to_s.chars
  num_rotating = num_array.pop(last_n)
  num_array.concat(rotate_array(num_rotating)).join('').to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
