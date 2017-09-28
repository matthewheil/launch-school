VOWELS = %w(a e i o u)

hsh = {
        first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.values.each do |_, arr|
  arr.each do |word|
    word.chars.each do |letter|
      puts letter if VOWELS.include?(letter)
    end
  end
end