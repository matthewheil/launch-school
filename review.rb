def index_difference(arr, ints)
  temp = ints.clone
  first_index = temp.index(arr.first)
  temp[first_index] = nil
  last_index = temp.index(arr.last)
  last_index - first_index
end

def sum_pairs(ints, s)
  result = ints.combination(2).select { |arr| arr.reduce(:+) == s }
  return nil if result.empty?
  closest = result.first
  result.each do |arr|
    closest_value = index_difference(closest, ints)
    current_value = index_difference(arr, ints)
    closest = arr if current_value < closest_value
  end
  closest
end

p sum_pairs([10, 5, 2, 3, 7, 5], 10)
