UPPER =* ('A'..'Z')
LOWER =* ('a'..'z')

def letter_case_count(string)
  hash = { lower: 0, upper: 0, neither: 0 }
  string.chars.each do |character|
    if LOWER.include?(character)
      hash[:lower] += 1
    elsif UPPER.include?(character)
      hash[:upper] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }
