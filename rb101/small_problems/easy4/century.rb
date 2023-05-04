# PEDAC
# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.
# Understand the Problem
#  - Expected inputs and outputs
#     inputs: a positive integer number (inferred from the examples) > 0 representing a year
#     outputs: a string that begins with the century number and ends with st, nd, rd, or th as appropriate for that number
#   - Make the requirement explicit
#     the program must identify and return the appropriate century number
#     the program must append the appropriate ending (st, nd, rd, th), meaning that it         
#       converts the number in an ordinal number
#   - Identify rules
#      century:
#        ends with 0, 4, 5, 6, 7, 8, 9: append "th"
#        ends with 1: append "st"      
#        ends with 2: append "nd"
#        ends with 3: append "rd"
#        century 1 == years 1-100
#        century 2 == years 101-200
#        so if a given year is dividid by 100, let's say 1989 (20th century), we get a float 19.#          89 that can be rounded up to 20 for 20th century.
#      year:
#        year 1-100 comprises century 1
#        year 101-200 comprises century 2
#        year 201-300 comprises century 3
#        etc...
# Examples
#   century(2000) == '20th'
#   century(2001) == '21st'
#   century(1965) == '20th'
#   century(256) == '3rd'
#   century(5) == '1st'
#   century(10103) == '102nd'
#   century(1052) == '11th'
#   century(1127) == '12th'
#   century(11201) == '113th'
# Data Structure
#   - we will be working with positive literal integers greater than zero, representing years, #      and converting those literal integers into strings where the appropriate ordinal ending #      is appended.
# Algorithm
#   - the method will accept an argument that is a positive literal integer
#   - that number will be divided by 100, converted to a float/decimal, and rounded UP to the  #       next integer value (so 1/100 will equal 1 for the 1st century).  
#   - that number will be converted to a string
#   - the appropriate suffix will be added to the resulting integer, based on the value of the last digit. numbers ending in 0, 4, 5, 6, 7, 8, 9, 11, 12 will be appended with "th", numbers ending in 1 will be appended with "st", numbers ending in 2 will be appended with "nd", and numbers ending in 3 will be appended with "rd".
# Code: 

def century(num)
  (num -= 1) if num.to_s.end_with?('0')
  num = (num/100) + 1
  century = num.to_s
  suffix(century)
end

def suffix(string)
  return string << 'th' if string.end_with?("11", "12", "13")
  return string << 'st' if string.end_with?('1')
  return string << 'nd' if string.end_with?('2')
  return string << 'rd' if string.end_with?('3')
  string << 'th'
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'