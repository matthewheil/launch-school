def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each { |num1| arr2.each { |num2| result << num1 * num2 } }
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs([4, 3, 1, 2], [2, 4])
