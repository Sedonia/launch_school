puts "Welcome to Calculator!"
puts "Please enter a number:"
num1 = gets.chomp
puts "Please enter a second number:"
num2 = gets.chomp
puts "What operation would you like to perform? Type add, subtract, multiply, or divide:"
operation = gets.chomp.downcase

loop do
  if operation == "add"
    puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
    break
  elsif operation == "subtract"
    puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}" 
    break
  elsif operation == "multiply"
    puts "#{num1} * #{num2} = #{num1.to_i * num2.to_i}" 
    break
  elsif operation == "divide"
    puts "#{num1} / #{num2} = #{num1.to_f / num2.to_f}"   # We have to add the float method here, otherwise we get integer division, which is not what we want. This is also why we don't convert to integer when we assign the user answer to our variables num1 and num2 above.
    break
  else
    puts "Oops! Something went wrong. Do you want to add, subtract, multiply, or divide?"
    operation = gets.chomp
  end
end


