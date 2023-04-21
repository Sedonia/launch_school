require 'yaml'
MESSAGES = YAML.load_file('mort_calc_msgs.yml')

MONTHS_IN_YR = 12

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num.to_s && num.to_i >= 0
end

def valid_float?(num)
  num.to_f.to_s == num.to_s && num.to_f >= 0
end

def positive?(num)
  num.to_f.positive?
end

def valid_positive_number?(num)
  valid_number?(num) && positive?(num)
end

def valid_over100?(num)
  valid_number?(num) && positive?(num) && num.to_i >= 100
end

def invalid_under100?(num)
  valid_number?(num) && positive?(num) && num.to_i < 100
end

def valid_under100?(num)
  valid_number?(num) && num.to_i <= 100
end

def invalid_over100?(num)
  valid_number?(num) && positive?(num) && num.to_i > 100
end

def validate_amount
  loan_amount = nil
  loop do
    prompt MESSAGES['amount']
    loan_amount = gets.chomp.gsub(',', '').gsub('$', '')
    if valid_over100?(loan_amount)
      break
    elsif invalid_under100?(loan_amount) || loan_amount == 0
      puts MESSAGES['low_amount']
    else
      puts MESSAGES['error']
    end
  end
  loan_amount.to_f.truncate(2)
end

def calculate_monthly_interest
  monthly_interest = nil
  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp.gsub('%', '')
    if valid_under100?(apr)
      monthly_interest = ((apr.to_f / MONTHS_IN_YR) / 100)
      break
    elsif invalid_over100?(apr)
      puts MESSAGES['too_high']
    else
      puts MESSAGES['error']
    end
  end
  monthly_interest
end

def calculate_duration
  duration_in_months = nil
  loop do
    prompt MESSAGES['duration']
    duration = gets.chomp
    if valid_positive_number?(duration) && duration.to_f <= 35
      duration_in_months = duration.to_f * MONTHS_IN_YR
      break
    elsif duration.to_f > 35 && positive?(duration)
      puts MESSAGES['too_long']
    else
      puts MESSAGES['error']
    end
  end
  duration_in_months
end

system "clear"
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

loop do
  loan_amount = validate_amount
  monthly_interest = calculate_monthly_interest
  apr_to_monthly = monthly_interest * 100
  duration_in_months = calculate_duration

  if monthly_interest.zero?
    monthly_payment = (loan_amount.to_i / duration_in_months.to_f)
  else
    monthly_payment = (loan_amount.to_i *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-duration_in_months))))
  end

  puts ""
  prompt MESSAGES['thanks']
  prompt MESSAGES['working']
  puts MESSAGES['space']
  puts MESSAGES['asterisks']
  puts "Montly Interest Rate is #{format('%.4f', apr_to_monthly)}%"
  puts "Loan Duration is #{duration_in_months.round()} months"
  puts "Monthly Payment is $#{format('%.2f', monthly_payment)}"
  puts MESSAGES['asterisks']
  puts MESSAGES['space']
  prompt MESSAGES['start_over']
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
  system "clear"
  puts MESSAGES['space']
  puts MESSAGES['start']
end

prompt("Okay, thanks for using the Mortgage Calculator! Bye!")
puts ""
