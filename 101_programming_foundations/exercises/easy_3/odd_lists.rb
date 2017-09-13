def oddities(arr)
  result = []
  count = 0

  until count == arr.size
    result << arr[count] if count.even?
    count += 1
  end

  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
