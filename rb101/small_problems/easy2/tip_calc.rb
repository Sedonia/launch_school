# Further Exploration (started with this, so yay!)

print "What is the bill? "
bill = gets.chomp.to_f

print "What percent do you want to tip? "
percent = gets.chomp.to_f

tip = (bill * (percent / 100))
bill = bill + tip
tip = format("%.2f", tip)
bill = format("%.2f", bill)

puts "The tip is $#{tip}"
puts "The bill is $#{bill}"