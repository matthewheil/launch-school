SQMETERS_TO_SQFEET = 10.7639

print "Enter the length of the room in meters: "
length_meters = gets.chomp.to_f

print "Enter the width of the room in meters: "
width_meters = gets.chomp.to_f

square_meters = length_meters * width_meters
square_feet = square_meters * SQMETERS_TO_SQFEET

puts  "The area of the room is #{square_meters} " \
      "square meters (#{square_feet} square feet)."
