# my solution didn't work because you can only use each block once

# understand the problem:
#   there is a colleciton of blocks that contain two letters per block
#   create a method that returns true if the letters in the word are contained
#   in the given blocks and both letters in a block are not in the word
#   return false otherwise
  
# Logic:
#   create an array of sub-arrays - sub-arrays being the letter blocks
#   create a flag variable to flip if condition is true
#   iterate through the letters in the word and check if all letters are included
#     in the letter block array setting the flag to true
#   also check if all letters in the sub-array blocks are included in the word
#     setting the flag to false

# def block_word?(word)
#   blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#           ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#           ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
#   flag = true
#   letters = word.split('')
#   letters.map! { |letter| letter.upcase }
#   blocks.each do |block|
#     if letters.include?(block[0]) && letters.include?(block[1])
#       flag = false
#     end
#   end
#   flag
# end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('blog') == false
p block_word?('bib') == false
