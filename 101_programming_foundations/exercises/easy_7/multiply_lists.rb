def multiply_list(arr1, arr2)
  result = []
  count = 0
  loop do
    result << arr1[count] * arr2[count]
    count += 1
    break if count >= arr1.size
  end
  result
end

def another_way(arr1, arr2)
  result = []
  arr1.each_with_index do |el, i|
    result << el * arr2[i]
  end
  result
end

def yet_another_way(arr1, arr2)
  arr1.zip(arr2).map { |zipped| zipped.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
p another_way([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
p yet_another_way([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
