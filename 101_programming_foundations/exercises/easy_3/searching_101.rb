require 'active_support/inflector'
include ActiveSupport::Inflector

def valid_integer?(user_input)
  user_input == user_input.to_i.to_s
end

def get_numbers
  numbers = []

  while numbers.length < 6
    if numbers.length < 5
      print "==> Enter the #{ordinalize(numbers.length + 1)} number: "
    else
      print "==> Enter the last number: "
    end

    number = gets.chomp
    valid_integer?(number) ? (numbers << number.to_i) : (puts "Invalid entry.")
  end

  numbers
end

def last_in_first_five?(arr)
  arr.first(5).include?(arr.last)
end

numbers = get_numbers

if last_in_first_five?(numbers)
  puts "The number #{numbers.last} appears in #{numbers.first(5)}."
else
  puts "The number #{numbers.last} does not appear in #{numbers.first(5)}."
end
