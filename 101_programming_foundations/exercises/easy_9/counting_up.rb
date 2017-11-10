def sequence(num)
  num > 1 ? (1..num).to_a : (num..1).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-3) == [-3, -2, -1, 0, 1]
p sequence(0) == [0, 1]