def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  letters = [*'a'..'z'] + [*'0'..'9']
  new_string = string.downcase.split('').select { |c| letters.include?(c) }.join
  palindrome?(new_string)
end

def another_way(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

p another_way('madam') == true
p another_way('Madam') == true           # (case does not matter)
p another_way("Madam, I'm Adam") == true # (only alphanumerics matter)
p another_way('356653') == true
p another_way('356a653') == true
p another_way('123ab321') == false
