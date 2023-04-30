# Original Answer using Array#sum

def sum(num)
  counter = 0
  array = []
  until counter == num
    array << counter += 1
  end
  sum = 0
  array.each {|num| sum += num}
  sum
end

def product(num)
  counter = 0
  array = []
  until counter == num
    array << counter += 1
  end
  product = 1
  array.each {|num| product *= num}
  product
end

print ">> Please enter an integer that is greater than zero: "
integer = gets.chomp.to_i

print ">> Enter 's' to compute the sum, 'p' to compute the product: "
answer = gets.chomp

sum = sum(integer)
product = product(integer)

if answer == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif answer == 'p'
  puts "The product of the integers between 1 and #{integer} is #{product}."
else
  puts "Invalid input. Please try again."
end

# Further Exploration (using Enumerable#inject) - MUCH more concise!

print ">> Please enter an integer that is greater than zero: "
integer = gets.chomp.to_i

print ">> Enter 's' to compute the sum, 'p' to compute the product: "
answer = gets.chomp

sum = (1..integer).inject(:+)
product = (1..integer).inject(:*)

if answer == 's'
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif answer == 'p'
  puts "The product of the integers between 1 and #{integer} is #{product}."
else
  puts "Invalid input. Please try again."
end