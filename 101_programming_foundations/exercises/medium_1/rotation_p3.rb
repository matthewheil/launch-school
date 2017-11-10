def rotate_array(array)
  array[1..-1] << array.first
end

def rotate_rightmost_digits(number, last_n)
  num_array = number.to_s.chars
  num_rotating = num_array.pop(last_n)
  num_array.concat(rotate_array(num_rotating)).join('').to_i
end

def max_rotation(num)
  count = 0
  size = num.to_s.size
  max_rotated_num = num
  loop do
    last_n = size - count
    max_rotated_num = rotate_rightmost_digits(max_rotated_num, last_n)
    break if count >= size - 2
    count += 1
  end
  max_rotated_num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
