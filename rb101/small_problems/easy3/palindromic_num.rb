def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further exploration: If your number begins with one or more zeros, the method will not work any longer. This is because Ruby interprets leading zeros in a number literal as a prefix indicating, in the case of 0, an octal number. So when you put 012345, or 000012345, Ruby thinks that you are telling it that 12345 is an octal number, so it converts it to 5349 (for example). It seems that the best (only?) way to compare numbers with leading zeros is to use strings instead of number literals. You would think that converting 012345 to a string using .to_s would work, but it turns out that there's no pre-empting the prefix thing. If you type 012345 as a number literal, Ruby will interpret that as an octal number and convert it to the appropriate integer value (5349 in this case) before it does anything else - like convert to string. So 012345.to_s returns the string "5349". You can convert a literal integer with leading zeros to a literal integer without the leading zeros by calling .to_s(8).to_i, or a string containing integers with leading zeros to a literal integer without the leading zeros by calling .to_i(10) (or just .to_i as they are equivalent) (see below for examples) , but that isn't really helpful within the method because there is no way to parse which string literals passed in as arguments contain leading zeros. The problem is that you can't check for leading zeros. Nor can you append leading zeros to make sure that everything is treated the same. None of that works, because Ruby interprets a literal integer with leading zeros FIRST, before it even looks at any of your attempts to check for those leading zeros. So... the short answer to "Is there any way to address this?" is not really. The only way is to enforce the use of strings by validating that the argument is a string and then, there must be as many zeros on the trailing end of the number as there are leading (ex: 00500 will be considered a palindrome, but not 005). I suppose that you could actually use regexp to remove leading zeros, but I have not done that here.

p 0034543  # => 14691 <- Ruby converts the number with leading zeros to an octal number
p 14691.to_s(8) # => "34543" <- Octal to integer in string
p 14691.to_s(10) # => "14691" <- Integer to string
p "0034543".to_i # => 34543 <- Octal in string to literal integer, no leading zeros
p "0034543".to_i(10) # => 34543 <- .to_i == .to_i(10)
p "0034543".to_i(8) # => 14691 <- Octal in string to literal octal number, no leading zeros
p 0034543.to_s(8).to_i  # => 34543 <- Octal to integer in string, no leading zeros, to literal integer 
p 14691.to_s(8).to_i # => 34543 <- Same as above! The difference is the lack of leading zeros

# Weirdly, this works:

puts "Please enter a number: "
answer = gets.chomp

def palindromic_number?(num)
  num = num.to_i
  num.to_s == num.to_s.reverse
end

p palindromic_number?(answer) # True if you put in a palindromic number with leading zeros, like 0034543
p palindromic_number?(34543) # True (no leading zeros)
p palindromic_number?(0034543) # False (leading zeros)

# I think the only way to check for palindromic numbers with leading zeros is to force the use of strings by 

def string?(input)
  if String.try_convert(input)
    input
  else
    false
  end
end

def palindromic_number?(string)
  if string?(string)
    string == string.reverse
  else
    false
  end
end

p palindromic_number?("003454300") == true
p palindromic_number?("123210") == false
p palindromic_number?("22") == true
p palindromic_number?("05") == false
# The above all return as true
