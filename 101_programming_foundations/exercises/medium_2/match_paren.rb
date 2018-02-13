# input: string
# output: boolean
# problem: check whether all opening parenthesis have a closing pair and that
#       they  are in the correct order (e.g. "()" and not ")(")
# logic: could do a count of all '(' and see if it matches a count of all ')'
# but that wouldn't prove proper order. Having a '(' doesn't mean the next paren
# has to be ')'. Have a count. Increment for '(' and decrement for ')' only if
# the count > 0.

def balanced?(string)
  count = 0
  string.chars.each do |char|
    count += 1 if char == '('
    if char == ')'
      if count > 0
        count -= 1
      else
        return false
      end
    end
  end
  count == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
