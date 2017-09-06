print "==> What is the bill? "
bill = gets.to_f

print "==> What is the tip percentage? "
tip = gets.to_f

tip_amount = bill * (tip / 100)
total = tip_amount + bill

puts "==> The tip is $#{format("%.2f", tip_amount)}"
puts "==> The total is $#{format("%.2f", total)}"
