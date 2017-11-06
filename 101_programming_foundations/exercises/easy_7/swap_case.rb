UPPERCASE =* ('A'..'Z')
LOWERCASE =* ('a'..'z')

def swapcase(string)
  string.split.map do |word|
    word.chars.map do |char|
      if UPPERCASE.include?(char)
        char.downcase
      elsif LOWERCASE.include?(char)
        char.upcase
      else
        char
      end
    end.join
  end.join(' ')
end

def another_way(string)
  characters = string.chars.map do |char|
    if UPPERCASE.include?(char)
      char.downcase
    elsif LOWERCASE.include?(char)
      char.upcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

p another_way('CamelCase') == 'cAMELcASE'
p another_way('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
