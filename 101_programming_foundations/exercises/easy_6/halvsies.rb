def halvsies(arr)
  first_half = []
  second_half = []
  count = 0
  if arr.size.even?
    while count < arr.size/2
      first_half << arr[count]
      count += 1
    end
    while count < arr.size
      second_half << arr[count]
      count += 1
    end
  else
    while count < (arr.size/2 + 1)
      first_half << arr[count]
      count += 1
    end
    while count < arr.size
      second_half << arr[count]
      count += 1
    end
  end
  [first_half, second_half]
end

def another_way(array)
  first_half = array.slice(0, (array.size/2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

p another_way([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p another_way([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p another_way([5]) #== [[5], []]
p another_way([]) #== [[], []]