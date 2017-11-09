def center_of(string)
  return nil if string.empty?
  middle_index = string.size / 2
  middle_char = ''
  if string.size.odd?
    middle_char << string[middle_index]
  else
    middle_char << string[middle_index - 1] << string[middle_index]
  end
  middle_char
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
