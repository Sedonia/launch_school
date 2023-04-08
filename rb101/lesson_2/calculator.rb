def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when 'add'
    'Adding'
  when 'subtract'
    'Subtracting'
  when 'multiply'
    'Multiplying'
  when 'divide'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = nil
loop do
  name = gets.chomp

  if name.empty?
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do # main loop
  num1 = nil
  loop do
    prompt("Please enter a number:")
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt("Something went wrong. Please enter a valid number.")
    end
  end

  num2 = nil
  loop do
    prompt("Please enter a second number:")
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt("Something went wrong. Please enter a valid number.")
    end
  end

  operator_prompt = <<-WORD
  What operation would you like to perform?
     Add
     Subtract
     Multiply
     Divide
  WORD

  prompt(operator_prompt) # The operator_prompt defined above is a heredoc

  operation = nil
  loop do
    operation = gets.chomp.downcase

    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("Must choose add, subtract, multiply, or divide.")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...") # Here we are using a method to convert our chosen operator into adding, subtracting, multiplying, or dividing so that we can display a message that confirms the user's choice.

  result = case operation
           when "add"
             num1.to_i + num2.to_i
           when "subtract"
             num1.to_i - num2.to_i
           when "multiply"
             num1.to_i * num2.to_i
           when "divide"
             num1.to_f / num2.to_f # We have to add the float method here, otherwise we get integer division, which is not what we want. This is also why we don't convert to integer when we assign the user answer to our variables num1 and num2 above.
           end
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator! Goodbye.")
