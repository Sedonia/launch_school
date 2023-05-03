def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Further exploration (write a method that determines if an array is palindromic, and then one that determines if an array OR string is palindromic. All that I did was change the parameter name for the method above, because String#reverse and Array#reverse accomplish the same thing.)

def palindrome?(input)
  input == input.reverse
end

array = 'madam'.chars
array1 = 'Madam'.chars
array2 = "madam i'm adam".chars
array3 = '356653'.chars

p palindrome?(array) == true
p palindrome?(array1) == false  # (case matters)
p palindrome?(array2) == false  # (all characters matter)
p palindrome?(array3) == true
