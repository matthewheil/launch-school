VOWELS = %w(a e i o u)

def remove_vowels(str_arr)
  str_arr.map do |word|
    word.split('').reject { |letter| VOWELS.include?(letter.downcase) }.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white))   # == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ))              # == ['BC', '', 'XYZ']
