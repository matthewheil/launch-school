(1..99).each do |number|
  next if number.even?
  puts number
end

def another_way
  (1..99).select { |number| puts number if number.odd? }
end

another_way
