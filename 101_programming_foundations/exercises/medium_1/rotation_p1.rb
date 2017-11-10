def rotate_array(array)
  array[1..-1] << array.first
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(string)
  rotate_array(string.chars).join('')
end

p rotate_string('LaunchSchool') == 'aunchSchoolL'
p rotate_string('This is a string.') == 'his is a string.T'

def rotate_number(num)
  rotate_string(num.to_s).to_i
end

p rotate_number(100) == 1
p rotate_number(123) == 231