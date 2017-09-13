def xor?(boolean1, boolean2)
  if boolean1 == false
    boolean2 ? (true) : (false)
  else
    boolean2 ? (false) : (true)
  end
end

def another_way(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

def yet_another_way(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
