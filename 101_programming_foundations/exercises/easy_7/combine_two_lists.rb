def interleave(arr1, arr2)
  new_array = []
  count = 0
  loop do
    new_array << arr1[count]
    new_array << arr2[count]
    count += 1
    break if count >= arr1.size
  end
  new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
