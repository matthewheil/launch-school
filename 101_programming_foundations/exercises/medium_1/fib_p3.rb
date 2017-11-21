# def fibonacci_last(nth)
#   return 1 if nth <= 2
#   previous = 1
#   current = 1
#   count = 3
#   loop do
#     fib = previous + current
#     return fib.to_s[-1].to_i if count >= nth
#     previous = current
#     current = fib
#     count += 1
#   end
# end

# def fibonacci_last(nth)
#   fibonacci(nth).to_s[-1].to_i
# end

def another_way(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last.to_s[-1].to_i, (first + last).to_s[-1].to_i]
  end
  last
end

def fib_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  
  last_2.last
end

def fibonacci_last(nth)
  another_way(nth % 60)
end

# stack level too deep (SystemStackError)
# def fibonacci_tail(nth, acc1, acc2)
#   if nth == 1
#     acc1
#   elsif nth == 2
#     acc2
#   else
#     fibonacci_tail(nth - 1, acc2.to_s[-1].to_i, (acc2 + acc1).to_s[-1].to_i)
#   end
# end
# 
# def fibonacci_last(nth)
#   fibonacci_tail(nth, 1, 1)
# end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123_456_789_987_745) # -> 5
