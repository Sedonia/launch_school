def multiply(num1, num2)
  num1 * num2
end

num = [2, 4]

p multiply(num, 3)
#=> [2, 4, 2, 4, 2, 4]

# When an array is passed as the first argument, the array is "multiplied" three times such that a new array is created with the array repeating n times, with n being the second argument.

arr = [3, 5]
p multiply(num, arr)  # This throws an exception (no conversion of array into integer)