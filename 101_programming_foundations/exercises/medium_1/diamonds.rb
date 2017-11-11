def diamond(number)
  1.upto(number) do |num| 
    puts ('*' * num).center(number) if num.odd?
  end
  (number-2).downto(1) do |num|
    puts ('*' * num).center(number) if num.odd?
  end
end

p diamond(1)
# 
# *
# 
p diamond(3)
# 
#  *
# ***
#  *
#  
p diamond(9)
# 
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
#     
