def calculate_bonus(salary, get_bonus)
  return 0 if get_bonus == false
  salary / 2
end

def another_way(salary, get_bonus)
  get_bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
