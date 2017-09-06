(1..99).each do |number|
  next if number.odd?
  puts number
end

def another_way
  (1..99).select { |number| puts number if number.even? }
end

another_way
