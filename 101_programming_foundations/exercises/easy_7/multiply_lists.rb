require 'pry'

def multiply_list(arr1, arr2)
  result = []
  count = 0
  loop do
    # binding.pry
    result << (arr1[count] * arr2[count])
    break if count >= arr1.size
    count += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Logic:
#   create a result array
#   count = 0
#   loop
#     result << arr1[count] * arr2[count]
#     break if count >= arr1.size
#     increment count
#   return result