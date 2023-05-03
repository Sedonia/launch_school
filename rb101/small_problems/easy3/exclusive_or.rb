def xor?(arg1, arg2)
  if arg1 && arg2
    return false
  elsif !arg1 && !arg2
    return false
  elsif arg1 && !arg2
    return true
  else
    return true
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# First attempt above. More streamlined below. Neither is as streamlined as LS's solution.

def xor?(arg1, arg2)
  if !arg1 && arg2
    true
  elsif arg1 && !arg2
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

###############################################
# LS's solution:

def xor?(arg1, arg2)
  return true if !arg1 && arg2
  return true if arg1 && !arg2
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

#################################################