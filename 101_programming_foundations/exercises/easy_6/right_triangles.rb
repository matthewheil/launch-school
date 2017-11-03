def triangle(size)
  spaces = size - 1
  loop do
    puts (" " * spaces) + ("*" * (size - spaces))
    break if spaces == 0
    spaces -= 1
  end
end

triangle(5)
triangle(9)
triangle(12)
