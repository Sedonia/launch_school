require 'yaml'
MESSAGES = YAML.load_file('mort_calc_msgs.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  (valid_integer?(num) || valid_float?(num)) && positive?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num && num != '0'
end

def valid_float?(num)
  num.to_f.to_s == num && num != '0'
end

def positive?(num)
  num.to_i.positive?
end

message = <<-WELCOME
Welcome to the Mortgage Calculator!

   Use this tool to calculate your:
    - Monthly Interest Rate
    - Loan Duration (in months)
    - Monthly Payment 

   You will need to provide:
    - Your Loan amount
    - You APR
    - Your loan duration in years
WELCOME

prompt(message)
puts MESSAGES['space']
prompt MESSAGES['start']
puts MESSAGES['space']

loan_amount = nil
monthly_interest = nil
duration_months = nil
monthly_payment = nil

loop do
  loop do
    prompt MESSAGES['amount']
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      puts MESSAGES['error']
    end
  end

  monthly_rate = nil
  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp
    if valid_number?(apr)
      monthly_rate = (apr.to_f / 12)
      monthly_interest = ((apr.to_f / 12) / 100)
      break
    else
      puts MESSAGES['error']
    end
  end

  loop do
    prompt MESSAGES['duration']
    duration = gets.chomp
    if valid_integer?(duration) && positive?(duration)
      duration_months = duration.to_i * 12
      break
    else
      print MESSAGES['error']
      puts MESSAGES['whole']
    end
  end

  monthly_payment = (loan_amount.to_i *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-duration_months))))

  prompt("Great, thanks for that information!")
  prompt("It looks like your...")
  puts MESSAGES['space']
  puts MESSAGES['asterisks']
  puts "Montly Interest Rate is #{monthly_rate.truncate(4)}%"
  puts "Loan Duration is #{duration_months} months"
  puts "Monthly Payment is $#{monthly_payment.truncate(2)}"
  puts MESSAGES['asterisks']
  puts MESSAGES['space']
  prompt MESSAGES['start_over']
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
  puts MESSAGES['space']
  puts MESSAGES['start']
end

prompt("Okay, bye!")
