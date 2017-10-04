arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

def arr_to_hsh(arr)
  hsh = {}
  arr.each do |sub_arr|
    key = sub_arr[0]
    value = sub_arr[1]
    hsh[key] = value
  end
  hsh
end

arr_to_hsh(arr)
