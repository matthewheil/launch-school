# count the number of occurrences of each element in a given array
# iterate through the array - compare the element to a hash
# if the element doesn't exist, add the element as the key and set value to 1
# if the element exists as a key, increment the value of that key by 1
# output the hash key/value pairs

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

# vehicle_count = {}
# 
# vehicles.each do |vehicle|
#   if vehicle_count.include?(vehicle)
#     vehicle_count[vehicle] += 1
#   else
#     vehicle_count[vehicle] = 1
#   end
# end
# 
# vehicle_count.each do |vehicle, count|
#   puts "#{vehicle} => #{count}"
# end

def count_occurrences(array)
  occurrences = {}

  array.each { |element| occurrences[element] = array.count(element) }

  occurrences.each { |element, count| puts "#{element} => #{count}" }
end

count_occurrences(vehicles)