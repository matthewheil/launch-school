# def select_fruit(produce)
#   selected_fruits = {}
#
#   produce.each_pair do |key, value|
#     selected_fruits[key] = value if value == "Fruit"
#   end
#
#   selected_fruits
# end

def select_fruit(produce)
  selected_fruits = {}
  produce_keys = produce.keys
  count = 0

  loop do
    break if produce_keys.size == count

    current_key = produce_keys[count]
    current_value = produce[current_key]

    if current_value == "Fruit"
      selected_fruits[current_key] = current_value
    end

    count += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce)
