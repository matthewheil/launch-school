def reverse(arr)
  new_arr = []
  arr.reverse_each { |element| new_arr << element }
  new_arr
end

def another_way(arr)
  arr.each_with_object([]) { |element, new_arr| new_arr.unshift(element) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

p another_way([1,2,3,4]) == [4,3,2,1]          # => true
p another_way(%w(a b c d e)) == %w(e d c b a)  # => true
p another_way(['abc']) == ['abc']              # => true
p another_way([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = another_way(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
