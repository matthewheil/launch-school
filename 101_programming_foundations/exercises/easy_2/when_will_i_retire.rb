print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

age_difference = retirement_age - age
current_year = Time.now.year
retirement_year = current_year + age_difference

puts "It is #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{age_difference} more years of work to go!"