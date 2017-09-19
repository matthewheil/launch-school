def cleanup(string)
  string.gsub(/[^a-z]+/i, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("9abc123?") == ' abc '
