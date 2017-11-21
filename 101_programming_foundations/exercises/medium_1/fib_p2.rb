def fibonacci(nth)
  return 1 if nth <= 2
  previous = 1
  current = 1
  count = 3
  loop do
    fib = previous + current
    return fib if count >= nth
    previous = current
    current = fib
    count += 1
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(200) == 280571172992510140037611932413038677189525
p fibonacci(2_000)
p fibonacci(20_000)
p fibonacci(200_000)
