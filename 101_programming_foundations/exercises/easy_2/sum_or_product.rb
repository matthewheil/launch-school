# print ">> Please enter an integer greater than 0: "
# number = gets.chomp.to_i
#
# print ">> Enter 's' to compute the sum, 'p' to compute the product: "
# choice = gets.chomp.downcase
#
# if choice == 's'
#   result = 0
#   number.times { |n| result += (n + 1) }
#   puts "The sum of the integers between 1 and #{number} is #{result}."
# end
#
# if choice == 'p'
#   result = 1
#   number.times { |n| result *= (n + 1) }
#   puts "The product of the integers between 1 and #{number} is #{result}."
# end

def compute_sum(number)
  (1..number).reduce(:+)
end

def compute_product(number)
#  (1..number).inject { |sum, n| sum *= n }
  (1..number).reduce(:*)
end

def valid_integer?(number)
  return false if number <= 0
  number.is_a? Integer
end

number = 0
choice = ''

loop do
  print ">> Please enter an integer greater than 0: "
  number = gets.chomp.to_i
  break if valid_integer?(number)
  puts ">> That was not a valid entry."
end

loop do
  print ">> Enter 's' to compute the sum, 'p' to compute the product: "
  choice = gets.chomp.downcase
  break if choice == 's' || choice == 'p'
  puts ">> That was an invalid choice."
end

if choice == 's'
  result = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{result}."
else
  result = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{result}."
end
