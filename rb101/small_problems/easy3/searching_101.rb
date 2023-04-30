array = []

print ">> Please enter a number: "
num = gets.chomp.to_i
array << num

print ">> Please enter a 2nd number: "
num = gets.chomp.to_i
array << num

print ">> Please enter a 3rd number: "
num = gets.chomp.to_i
array << num

print ">> Please enter a 4th number: "
num = gets.chomp.to_i
array << num

print ">> Please enter a 5th number: "
num = gets.chomp.to_i
array << num

print ">> Last one! Please enter one more number: "
num6 = gets.chomp.to_i

if array.include?(num6)
  puts "The number #{num6} appears in #{array}."
else
  puts "The number #{num6} does not appear in #{array}."
end