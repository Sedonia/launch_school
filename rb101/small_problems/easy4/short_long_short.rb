# PEDAC
# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Understand the Problem
#  - Expected inputs and outputs
#     inputs: two strings
#     outputs: one string
#   - Make the requirement explicit
#     two strings must be passed to the method as arguments
#     the length of the two strings must be different
#     the shorter string must be concatenated to either side of the longer string
#   - Identify rules
#     the shorter of the two strings can be empty (implied from examples provided)
#     the length of the two strings must be different
#     the shorter string must be concatenated to either side of the longer string
#     there should be no spaces between the strings after concatenation
# Examples
#   - short_long_short('abc', 'defgh') == "abcdefghabc"
#   - short_long_short('abcde', 'fgh') == "fghabcdefgh"
#   - short_long_short('', 'xyz') == "xyz"
# Data Structure
#   - we'll be working with strings and concatenation
# Algorithm
#   - determine which of the two strings passed as arguments to the method is longer
#   - store that string to a variable
#   - store the shorter string to another variable
#   - concatenate the shorter + longer + shorter strings using the variables
# Code: 

def short_long_short(string1, string2)
  if string1.length > string2.length
    longer = string1
    shorter = string2
  else
    longer = string2
    shorter = string1
  end
  shorter + longer + shorter
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Another way (ternary operator):

def short_long_short(string1, string2)
  (string1.length > string2.length) ? string2 + string1 + string2 : string1 + string2 + string1
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# A shorter way than my original:

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"