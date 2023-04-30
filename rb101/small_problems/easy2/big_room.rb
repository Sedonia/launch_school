SQMETER_TO_FEET = 10.7639

print "Enter the length of the room in meters: "
length = gets.chomp.to_f

print "Enter the width of the room in meters: "
width = gets.chomp.to_f

square_meter = (length * width).round(2)
square_feet = (SQMETER_TO_FEET * square_meter).round(2)

puts "The area of the room is #{square_meter} square meters (#{square_feet} square feet)"

# Futher Exploration

SQFEET_TO_INCHES = 12**2
SQFEET_TO_CM = 30.48**2

print "Enter the length of the room in feet: "
length = gets.chomp.to_f

print "Enter the width of the room in feet: "
width = gets.chomp.to_f

square_feet = (length * width).round(2)
square_inches = (SQFEET_TO_INCHES * square_feet).round(2)
square_cm = (SQFEET_TO_CM * square_feet).round(2)

puts "The area of the room is #{square_feet} square feet (#{square_inches} square inches, #{square_cm} square centimeters)."
