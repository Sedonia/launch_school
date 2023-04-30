print "What is your age? "
current_age = gets.chomp.to_i

print "At what age do you hope to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year
time_to_retire = retirement_age - current_age
retirement_year = current_year + time_to_retire

puts "It is #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{time_to_retire} years of work left!"

# My solution was almost EXACTLY the same as LS's! Go me!