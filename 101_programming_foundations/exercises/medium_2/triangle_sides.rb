# input: three numbers equaling the sides of tringles
# output: a symbol indicating if the triangle is
#         equilateral - all three sides the same
#         isosceles - two sides are the same
#         scalene - all three sides are different
#         invalid - sum of two shortest sides isn't greater than longest sides
#                   or one of the sides is 0
# problem: check the numbers given to see if it makes a valid triangle
# deconstruct the problem:
#   have a method to check if the inputs make a valid triangle
#   count the number of sides and store
#   do a case statement for the count

def valid_triangle?(sides)
  return false if sides.include?(0)
  sides[0] + sides[1] > sides[2]
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort!
  return :invalid unless valid_triangle?(sides)
  equal_sides = 0

  sides.each do |side|
    equal_sides = sides.count(side)
    break if equal_sides > 1
  end

  case equal_sides
  when 2 then :isosceles
  when 3 then :equilateral
  else :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
