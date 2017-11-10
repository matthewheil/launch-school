def buy_fruit(list)
  correct_list = []
  list.each do |fruit|
    fruit[1].times do
      correct_list << fruit[0]
    end
  end
  correct_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
