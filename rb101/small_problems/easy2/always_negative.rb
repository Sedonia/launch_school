def negative(num)
  if num.negative?
    return num
  elsif num.positive?
    return -num
  else
    return num
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      

# LS's solution is much more succint (ternary operator)

def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      

# In Further Exploration, they highlight an even more succinct (but perhaps not preferrable) way

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      
