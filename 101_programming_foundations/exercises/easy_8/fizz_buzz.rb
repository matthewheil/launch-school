def fizzbuzz(start_num, end_num)
  numbers =* (start_num..end_num)
  numbers.each do |num|
    if (num % 5 == 0) && (num % 3 == 0)
      puts "FizzBuzz"
      next
    elsif num % 5 == 0
      puts "Buzz"
    elsif num % 3 == 0
      puts "Fizz"
    else
      puts num
    end
  end
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
