def make_array_hash(arr)
  arr.each_with_index.each_with_object({}) { |(el, idx), hsh| hsh[el] = idx }
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

puts make_array_hash(flintstones)
