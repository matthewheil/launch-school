def assign_name
  print "Enter a name: "
  name = gets.chomp
  name = "Teddy" if name.empty?
  name
end

name = assign_name

age = rand(20..200)

puts "#{name} is #{age} years old!"
