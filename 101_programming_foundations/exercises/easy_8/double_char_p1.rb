def repeater(string)
  repeater_string = ''
  string.chars.each do |char|
    repeater_string.concat(char * 2)
  end
  repeater_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
