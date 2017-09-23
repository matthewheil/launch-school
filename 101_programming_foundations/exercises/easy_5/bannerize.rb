def print_in_box(text)
  top_bottom = '+-' + ''.center(text.length, '-') + '-+'
  blank_line = '| ' + ''.center(text.length, ' ') + ' |'
  
  puts top_bottom
  puts blank_line
  puts '| ' + text + ' |'
  puts blank_line
  puts top_bottom
end

print_in_box('This is a test.')
print_in_box('')
print_in_box('To boldly go where no one has gone before.')
