def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64

# Further Exploration

def nth_power(num, power)
  multiply(num, 1) ** power
end

p nth_power(5, 2) == 25
p nth_power(-8, 5) == -32768
